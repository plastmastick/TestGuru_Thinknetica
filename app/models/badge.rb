# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy

  validates :title, presence: true
  validates :img, presence: true
  validates :rule, presence: true

  RULES = %w[first_attempt? all_tests_by_level? all_tests? all_backend_tests?].freeze
end
