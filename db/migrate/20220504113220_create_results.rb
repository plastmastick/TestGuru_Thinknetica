# frozen_string_literal: true

class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false

      t.timestamps
    end
  end
end
