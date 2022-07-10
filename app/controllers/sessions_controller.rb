# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    set_user_by_email

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to cookies.delete(:store_location) || root_path
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
end
