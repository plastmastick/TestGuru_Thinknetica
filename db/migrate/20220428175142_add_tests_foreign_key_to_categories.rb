class AddTestsForeignKeyToCategories < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key(:tests, :categories, if_not_exists: true)
  end
end
