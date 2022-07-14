# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :author_tests, class_name: "Test", foreign_key: :author_id,
                          dependent: :nullify, inverse_of: :author

  REGEXP_EMAIL = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+-+)|([A-Za-z0-9]+\.+)
                  |([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  validates :first_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: {
                      with: REGEXP_EMAIL,
                      message: 'Wrong format',
                      multiline: true
                    }

  def tests_by_level(search_level)
    tests.where(tests: { level: search_level })
  end

  def full_name
    "#{last_name} #{first_name}"
  end
end
