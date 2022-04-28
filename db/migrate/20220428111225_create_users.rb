# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :password, null: false
      t.string :group, null: false

      t.timestamps
    end
  end
end
