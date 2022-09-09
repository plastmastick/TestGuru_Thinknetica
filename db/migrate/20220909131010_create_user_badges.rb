class CreateUserBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :user_badges do |t|
      t.references :badge, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :achieved, default: 0, null: false

      t.timestamps
    end
  end
end
