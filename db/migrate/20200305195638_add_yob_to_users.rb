class AddYobToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :yob, :string
  end
end
