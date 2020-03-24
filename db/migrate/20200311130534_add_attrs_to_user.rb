class AddAttrsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :sub, :string
    add_column :users, :name, :string
    add_column :users, :picture, :string
  end
end
