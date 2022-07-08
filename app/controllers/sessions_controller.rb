# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    set_user_by_email

    if @user&.authenticate(params[:password])
      success_auth
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    redirect_to login_path
    session.clear
  end

  private

  def set_user_by_email
    @user = User.find_by(email: params[:email])
  end

  def success_auth
    session[:user_id] = @user.id
    redirect_to store_location_or_(root_path)
    clear_store_location
  end
end
