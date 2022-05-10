# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results, dependent: nil
  has_many :tests, foreign_key: :author_id, dependent: nil, inverse_of: :user

  def tests_by_level(search_level)
    Test.joins('JOIN results ON tests.id = results.test_id')
        .where(results: { user_id: id }, tests: { level: search_level })
  end
end
