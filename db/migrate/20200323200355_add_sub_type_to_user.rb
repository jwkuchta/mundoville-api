class AddSubTypeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :id_provider, :string
  end
end
