class ChangeUserYobFromIntegerToString < ActiveRecord::Migration[6.0]
  def change
    reversible do |col|
      change_table :users do |t|
        col.up   { t.change :yob, :integer }
        col.down { t.change :yob, :string }
      end
    end
  end
end
