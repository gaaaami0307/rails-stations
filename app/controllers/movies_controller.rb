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
end