# frozen_string_literal: true

class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :git_id, presence: true
end
