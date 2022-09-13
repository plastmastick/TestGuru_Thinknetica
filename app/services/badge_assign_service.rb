# frozen_string_literal: true

class BadgeAssignService
  def initialize(result)
    @badges = Badge.all
    @result = result
    @user = result.user
    @test = result.test
  end

  def call
    @badges.select do |badge|
      if badge.option.blank?
        send(badge.rule)
      else
        send(badge.rule, badge.option)
      end
    end
  end

  private

  def all_tests_tried_to_pass?
    Test.all.count <= @user.results.pluck(:test_id).uniq.count
  end

  def all_tests_passed?
    Test.all.count <= @user.results.where(passed: true).pluck(:test_id).uniq.count
  end

  def first_attempt?(test_title)
    test = Test.where(title: test_title).first
    return if @test != test

    @user.results.where(test: test).order(id: :asc).first.passed == true
  end

  def all_tests_by_level?(level)
    return if @test.level.to_s != level

    Test.by_level(level).count == @user.tests.by_level(level).uniq.count
  end

  def all_tests_by_category?(category)
    return if @test.category.title != category

    Test.by_category(category).count == @user.tests.by_category(category).uniq.count
  end
end
