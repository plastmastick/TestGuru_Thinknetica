# frozen_string_literal: true

class BadgesController < ApplicationController
  def index
    @user_badges = current_user.badges
    @badges = Badge.all
  end
end
