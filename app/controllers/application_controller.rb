# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  helper_method :current_messages, :add_message, :clear_messages

  def current_messages
    @@messages ||= {}
  end

  protected

  def after_sign_in_path_for(resource)
    resource.is_a?(Admin) ? admin_tests_path : super
  end

  def add_message(type, text)
    type = type.to_sym
    @@messages ||= {}
    @@messages[type] ||= []
    @@messages[type].push(text)
  end

  def clear_messages
    @@messages = {}
  end
end
