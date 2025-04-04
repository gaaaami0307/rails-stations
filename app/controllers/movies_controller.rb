class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    if !params[:is_showing].present?
      params[:is_showing] = "all"
    end

    if params[:is_showing] != "all"
      @movies = @movies.where(is_showing: params[:is_showing])
    end

    if params[:keyword].present?
      query = "%#{params[:keyword]}%"
      @movies = @movies.where("name LIKE ? OR description LIKE ?", query, query)
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules
  end

  def reservation
    @movie = Movie.find_by(id: params[:movie_id])
    if !params[:schedule_id].present?
      redirect_to movie_path(@movie), status:302
      return
    end

    if !params[:date].present?
      redirect_to movie_path(@movie), status:302
      return
    end

    @schedule = Schedule.find_by(id: params[:schedule_id])
    @sheets = Sheet.all
    @reservations = Reservation.all
    @screens = Screen.all
  end
end