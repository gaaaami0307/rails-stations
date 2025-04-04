class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] # ログインが必要
  
  def index
    @movie = Movie.find_by(id: params[:movie_id])
    if !params[:schedule_id].present?
      redirect_to movie_path(@movie), status:302
    end

    if !params[:date].present?
      redirect_to movie_path(@movie), status:302
    end

    @schedule = Schedule.find_by(id: params[:schedule_id])
    @sheets = Sheet.all
  end

  def new

    @movie = Movie.find_by(id: params[:movie_id])

    if @movie.nil?
      flash[:alart]="映画が見つかりませんでした"
      redirect_to movies_path
      return
    end

    @schedules = @movie.schedules
    @schedule = Schedule.find_by(id: params[:schedule_id])

    if !params[:sheet_id].present?
      render "movies/show", status:400
      return
    end

    if !params[:date].present?
      render "movies/show", status:400

      return
    end

    if !params[:screen_id].present?
      render "movies/show", status:400

      return
    end

    @sheet = Sheet.find_by(id: params[:sheet_id])
    @screen = Screen.find_by(id: params[:screen_id])

    if Reservation.find_by(schedule_id: @schedule.id, sheet_id: @sheet.id, date: params[:date], screen_id: @screen.id).present?
      flash[:alert]="その座席は予約済みです。"
      redirect_to movie_path(@movie), status:302
      return
    end

    @reservation = Reservation.new
    @reservation.name = current_user.name
    @reservation.email = current_user.email
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @schedule = @reservation.schedule
    @movie = @schedule.movie
    @screen = @reservation.screen

    if Reservation.find_by(date: @reservation.date, sheet_id: @reservation.sheet_id, schedule_id: @reservation.schedule_id, screen_id: @screen.id) != nil
      flash[:alert] = "その座席はすでに予約済みです" # 即時表示
      redirect_to movie_reservation_path(@movie, schedule_id: @schedule.id, date: @reservation.date)
    elsif @reservation.save
      redirect_to movie_path(@movie), notice: "予約が完了しました"
    else
      flash[:alert] = "予約に失敗しました。"
      redirect_to movie_reservation_path(@movie, schedule_id: @schedule.id, date: @reservation.date)
    end
  end
  private

  def reservation_params
    params.require(:reservation).permit(:schedule_id, :sheet_id, :name, :email, :date, :screen_id)
  end
end