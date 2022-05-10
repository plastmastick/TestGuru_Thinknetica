# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers, dependent: nil
  belongs_to :test
end
