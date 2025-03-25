class Admin::SchedulesController < ApplicationController
  def index
    @movies = Movie.all
  end
end