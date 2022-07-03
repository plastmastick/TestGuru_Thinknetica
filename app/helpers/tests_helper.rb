# frozen_string_literal: true

module TestsHelper
  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def author_name(test)
    if test.author.nil?
      'Unknown'
    else
      test.author.full_name
    end
  end
end
