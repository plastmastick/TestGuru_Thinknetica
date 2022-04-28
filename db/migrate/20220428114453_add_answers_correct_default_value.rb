# frozen_string_literal: true
class AddAnswersCorrectDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:answers, :correct, from: nil, to: false)
  end
end
