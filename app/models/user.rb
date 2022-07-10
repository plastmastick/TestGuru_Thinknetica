# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :author_tests, class_name: "Test", foreign_key: :author_id,
                          dependent: :nullify, inverse_of: :author

  REGEXP_EMAIL = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+-+)|([A-Za-z0-9]+\.+)
                  |([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  validates :full_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: {
                      with: REGEXP_EMAIL,
                      message: 'Wrong format',
                      multiline: true
                    }

  has_secure_password

  def tests_by_level(search_level)
    tests.where(tests: { level: search_level })
  end
end
