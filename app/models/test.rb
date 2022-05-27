# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", inverse_of: :author_tests, optional: true

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, presence: true,
                    numericality: { greater_than: 0, only_integer: true }

  scope :by_level, ->(value) { where(level: value) }
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :high, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, lambda { |category_title|
                        joins(:category)
                          .where(categories: { title: category_title })
                          .order(title: :desc)
                      }

  def self.title_by_category(category_title)
    by_category(category_title).pluck(:title)
  end
end
