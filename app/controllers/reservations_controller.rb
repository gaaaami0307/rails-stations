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
    @schedule = Schedule.find_by(id: params[:schedule_id])
    @sheets = Sheet.find_by(id: params[:sheet_id])
  end
end