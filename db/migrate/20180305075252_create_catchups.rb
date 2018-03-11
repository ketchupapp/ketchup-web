class CreateCatchups < ActiveRecord::Migration[5.1]
  def change
    create_table :catchups do |t|
      t.belongs_to :friend
      t.timestamp :happened_at

      t.timestamps
    end
  end
end
