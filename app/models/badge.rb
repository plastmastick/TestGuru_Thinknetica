# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy

  validates :title, presence: true
  validates :img, presence: true
  validates :rule, presence: true
end
