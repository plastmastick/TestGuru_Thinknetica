class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :img, null: false, default: "badge_default.jpeg"
      t.integer :rule, null: false

      t.timestamps
    end
    add_index :badges, :title, unique: true
  end
end
