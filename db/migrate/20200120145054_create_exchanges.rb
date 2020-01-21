class CreateExchanges < ActiveRecord::Migration[6.0]
  def change
    create_table :exchanges do |t|

      t.integer :first_user_id
      t.integer :second_user_id

      t.timestamps
    end
  end
end
