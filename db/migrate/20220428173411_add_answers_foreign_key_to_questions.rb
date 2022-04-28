class AddAnswersForeignKeyToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key(:answers, :questions, if_not_exists: true)
  end
end
