# frozen_string_literal: true

class Admin < User
  validates :last_name, presence: true
end
