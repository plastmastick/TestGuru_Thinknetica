# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :questions, dependent: nil
  has_many :results, dependent: nil
  belongs_to :category
  belongs_to :user, foreign_key: :author_id, inverse_of: :tests

  def self.tests_name_by_category(category_name)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: category_name })
        .order('title DESC').pluck(:title)
  end
end
