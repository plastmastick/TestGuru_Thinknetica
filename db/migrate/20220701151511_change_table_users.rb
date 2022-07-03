class ChangeTableUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.rename :password, :password_digest
      t.rename :name, :full_name
      t.rename :group, :role
    end

    change_column_default :users, :role, 'student'
  end
end
