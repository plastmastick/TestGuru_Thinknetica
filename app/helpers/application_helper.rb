# frozen_string_literal: true

module ApplicationHelper
  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze
  AUTHOR = 'plastmastick'
  REPO = 'TestGuru'

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def current_year
    Time.zone.now.year
  end

  def github_url
    "https://github.com/#{AUTHOR}/#{REPO}"
  end
end
