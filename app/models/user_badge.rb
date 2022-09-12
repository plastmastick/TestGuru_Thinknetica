# frozen_string_literal: true

class UserBadge < ApplicationRecord
  belongs_to :badge
  belongs_to :user

  validates :achieved, inclusion: { in: [true, false] }
end
