class ChangeImageToPost < ActiveRecord::Migration[6.1]
  def change
    change_column_default :badges, :img, 'badge_default.jpg'
  end
end
