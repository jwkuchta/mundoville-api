class AddDobToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :yob, :integer
  end
end
