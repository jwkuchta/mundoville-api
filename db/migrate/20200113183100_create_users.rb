class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string "username"
      t.string "first_name"
      t.string "last_name"
      t.string "email"
      t.string "password_digest"
      t.text "bio"
      t.string "profile_pic"
      t.boolean "verified", default: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
