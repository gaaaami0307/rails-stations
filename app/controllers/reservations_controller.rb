class ReservationsController < ApplicationController
  def index
    @sheets = Sheet.all
  end
end