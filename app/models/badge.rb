# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy

  validate :title, presence: true
  validate :img, presence: true
  validate :rule, presence: true
end
