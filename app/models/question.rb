# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :gists, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :body, presence: true
end
