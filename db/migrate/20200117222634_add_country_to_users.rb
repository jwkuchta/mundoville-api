class AddCountryToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :users, :language1, :string
    add_column :users, :language2, :string
    add_column :users, :language3, :string
  end
end
