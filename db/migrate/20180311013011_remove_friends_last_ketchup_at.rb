class RemoveFriendsLastKetchupAt < ActiveRecord::Migration[5.1]
  def change
    remove_column :friends, :last_ketchup_at
  end
end
