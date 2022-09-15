# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[edit update destroy]

  def index
    @user_badges = current_user.badges
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = current_user.badges.build(badge_params)
    if @badge.save
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      set_badge
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :description, :rule, :option)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end
end
