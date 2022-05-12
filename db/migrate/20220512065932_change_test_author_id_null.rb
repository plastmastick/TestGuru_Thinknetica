# frozen_string_literal: true

class ChangeTestAuthorIdNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:tests, :author_id, true)
  end
end
