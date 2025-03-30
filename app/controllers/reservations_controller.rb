class ReservationsController < ApplicationController
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

    if !params[:sheet_id].present?
      redirect_to movie_path(@movie), status:302
      return
    end

    if !params[:date].present?
      redirect_to movie_path(@movie), status:302
      return
    end

    @schedule = Schedule.find_by(id: params[:schedule_id])
    @sheet = Sheet.find_by(id: params[:sheet_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @schedule = @reservation.schedule
    @movie = @schedule.movie

    if Reservation.find_by(date: @reservation.date, sheet_id: @reservation.sheet_id, schedule_id: @reservation.schedule_id) != nil
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
    params.require(:reservation).permit(:schedule_id, :sheet_id, :name, :email, :date)
  end
end