class AddScorePassedToResult < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :score, :decimal,
               default: 0, null: false, precision: 13, scale:2
    add_column :results, :passed, :boolean, default: false, null: false
  end
end
