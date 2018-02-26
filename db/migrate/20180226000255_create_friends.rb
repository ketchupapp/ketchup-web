class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.string :name
      t.string :nickname
      t.timestamp :last_ketchup_at
      t.string :avatar_url
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
