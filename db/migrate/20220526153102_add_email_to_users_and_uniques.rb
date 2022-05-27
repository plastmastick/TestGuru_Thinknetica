# frozen_string_literal: true

class AddEmailToUsersAndUniques < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string, unique: true
    add_index :users, :email, unique: true
    add_index :tests, [:title, :level], unique: true
    add_index :categories, :title, unique: true
  end
end
