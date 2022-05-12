# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :author_tests, class_name: "Test", foreign_key: :author_id,
                          dependent: :nullify, inverse_of: :author

  def tests_by_level(search_level)
    tests.where(tests: { level: search_level })
  end
end
