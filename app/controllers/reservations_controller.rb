class ReservationsController < ApplicationController
  def index
    @movie = Movie.find_by(id: params[:movie_id])
    @schedule = Schedule.find_by(id: params[:sid])
    @sheets = Sheet.all
  end

  def new
    
  end
end