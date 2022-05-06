# frozen_string_literal: true

class Test < ApplicationRecord
  def self.tests_name_by_category(category_name)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: category_name })
        .order('title DESC').pluck(:title)
  end
end
