# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  helper_method :render_messages

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

  def render_messages(msg_type = :all)
    flash.each { |k,v| add_message(k,v) } if flash
    @@messages ||= {}
    msg = @@messages
    @@messages = {}
    render(partial: 'shared/flash', locals: { messages: msg, msg_type: msg_type.to_sym }) if msg.present?
  end
end
