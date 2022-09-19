class AddFinishToResultAddTimerTimeToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :finish_until, :datetime
    add_column :results, :finish_at, :datetime
    add_column :tests, :time, :integer
  end
end
