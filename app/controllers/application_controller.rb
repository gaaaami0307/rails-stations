class ApplicationController < ActionController::Base

  def hello
    render :plain => 'Hello!'
  end

  def bye
    render :plain => 'bye!'
  end

end
