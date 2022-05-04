# frozen_string_literal: true

class User < ApplicationRecord
  def tests_by_level(level)
    results_join = 'JOIN results ON tests.id = results.test_id'
    Test.joins(results_join).where("results.user_id = #{id}").and(Test.where(level: level))
  end
end
