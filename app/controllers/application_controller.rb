# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    resource.is_a?(Admin) ? admin_tests_path : super
  end

  def flash_message(type, text)
    flash[type] ||= []
    flash[type] = [flash[type]] unless flash[type].is_a?(Array)
    flash[type] << text
  end
end
