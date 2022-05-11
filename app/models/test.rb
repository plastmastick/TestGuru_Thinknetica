# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", inverse_of: :author_tests

  has_many :questions, dependent: nil
  has_many :results, dependent: nil
  has_many :users, through: :results

  def self.tests_title_by_category(category_title)
    Test.joins(:category)
        .where(categories: { title: category_title })
        .order(title: desc)
        .pluck(:title)
  end
end
