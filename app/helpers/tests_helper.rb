# frozen_string_literal: true

module TestsHelper
  TEST_LEVELS = {
    0 => :easy,
    1 => :elementary,
    2 => :advanced,
    3 => :hard
  }.freeze

  def test_level(test)
    level_name = TEST_LEVELS[test.level] || :epic
    t("helpers.tests.levels.#{level_name}")
  end

  def author_name(test)
    if test.author.nil?
      t('helpers.tests.unknown')
    else
      test.author.full_name
    end
  end
end
