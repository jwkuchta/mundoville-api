class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.integer 'friend_id'
      t.integer 'user_id'
    end
  end
end
