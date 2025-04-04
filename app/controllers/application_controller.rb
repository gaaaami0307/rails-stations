class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def hello
    render :plain => 'Hello!'
  end

  def bye
    render :plain => 'bye!'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # サインアップ時にnameを許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name]) # アカウント更新時にもnameを許可
  end

end
