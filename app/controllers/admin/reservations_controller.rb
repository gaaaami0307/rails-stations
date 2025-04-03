class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    #@reservations = @reservations.joins(:schedule)
    #.where("TIMESTAMP(reservations.date, schedules.start_time) >= ?", Time.current)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @schedule = @reservation.schedule
    @movie = @schedule.movie

    if Reservation.find_by(date: @reservation.date, sheet_id: @reservation.sheet_id, schedule_id: @reservation.schedule_id) != nil
      flash.now[:alert] = "その座席はすでに予約済みです" # 即時表示
      render :new, status:400
      return
    elsif @reservation.save
      redirect_to admin_reservations_path, notice: "予約が完了しました"
    else
      flash.now[:alert] = "予約に失敗しました。"
      render :new, status:400
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @schedule = @reservation.schedule
    @movie = @schedule.movie
    @sheet = @reservation.sheet
  end

  def update
    @reservation = Reservation.find(params[:id])
    @schedule = @reservation.schedule
    @movie = @schedule.movie
    @sheet = @reservation.sheet

    if Reservation.find_by(date: params[:reservation][:date], sheet_id: params[:reservation][:sheet_id], schedule_id: params[:reservation][:schedule_id]) != nil
      flash.now[:alert] = "その座席はすでに予約済みです" # 即時表示
      render :show, status:400
    elsif @reservation.update(reservation_params)
      redirect_to admin_reservations_path, notice: "更新に成功しました！"
    else
      flash.now[:alert] = "更新に失敗しました。"
      render :show, status:400
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @schedule = @reservation.schedule
    @movie = @schedule.movie
    @sheet = @reservation.sheet

  if @reservation.delete
      redirect_to admin_reservations_path, notice: "削除に成功しました！"
    else
      flash.now[:alert] = "削除に失敗しました。"
      render :show, status:400
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:schedule_id, :sheet_id, :name, :email, :date)
  end
end