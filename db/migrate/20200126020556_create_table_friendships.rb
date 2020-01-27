class CreateTableFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.integer :friend_id
      t.integer :user_id

      t.timestamps
    end
  end
end
