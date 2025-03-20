class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def create
    @movie = Movie.new(movie_params)

    @movie.save
    render json: @movie
  end
end