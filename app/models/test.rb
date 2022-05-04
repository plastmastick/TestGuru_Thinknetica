# frozen_string_literal: true

class Test < ApplicationRecord
  def self.tests_name_by_category(category_name)
    categories_join = 'JOIN categories ON tests.category_id = categories.id'
    Test.select(:title).joins(categories_join).where("categories.title = '#{category_name}'")
  end
end
