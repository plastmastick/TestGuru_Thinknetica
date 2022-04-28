class AddQuestionsForeignKeyToTests < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key(:questions, :tests, if_not_exists: true)
  end
end
