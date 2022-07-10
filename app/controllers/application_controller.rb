# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception
  helper_method :current_user,
                :logged_in?,
                :store_location_or_,
                :clear_store_location

  private

  def authenticate_user!
    return if current_user

    store_location
    redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please'
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def store_location
    cookies[:store_location] = request.url
  end
end
