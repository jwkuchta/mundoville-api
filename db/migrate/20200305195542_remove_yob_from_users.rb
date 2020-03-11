class RemoveYobFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :yob, :integer
    remove_column :users, :age, :integer
  end
end
