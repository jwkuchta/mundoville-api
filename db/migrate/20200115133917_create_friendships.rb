class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.integer 'user_id'
      t.integer 'friended_id'

      t.timestamps
    end
  end
end

# this is our join table for users to become friended and friend other users
