# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results, dependent: nil
  has_many :tests, through: :results
  has_many :author_tests, class_name: "Test", foreign_key: :author_id,
                          dependent: nil, inverse_of: :author

  def tests_by_level(search_level)
    Test.joins(:results)
        .where(results: { user_id: id }, tests: { level: search_level })
  end
end
