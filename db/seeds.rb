# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# USERS SEED DATA:

# string "username"
# t.string "username"
# t.string "first_name"
# t.string "last_name"
# t.string "email"
# t.string "password_digest"
# t.text "bio"
# t.string "profile_pic"
# t.boolean "verified", default: false
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false
# t.string "country"
# t.string "city"
# t.string "language1"
# t.string "language2"
# t.string "language3"
# t.string "occupation"
# t.string "yob"
# t.string "nickname"
# t.string "sub"
# t.string "name"
# t.string "picture"

User.destroy_all

t1 = User.create(username: 'test1', first_name: 'Juan', last_name: 'Prueba', email: 'jprueba@gmail.com', country: 'Chile', city: 'Valparaiso', language1: 'Spanish', language2: 'English', yob: '1980', sub: 'test1')
t2 = User.create(username: 'test2', first_name: 'Mimi', last_name: 'Prueba', email: 'mprueba@gmail.com', country: 'Chile', city: 'Valparaiso', language1: 'Spanish', language2: 'English', yob: '1986', sub: 'test2')
u1 = User.create(username: 'test3', first_name: 'Paola', last_name: 'Prueba', email: 'paola.a@gmail.com', country: 'Chile', city: 'Valparaiso', language1: 'Spanish', language2: 'English', yob: '1990', sub: 'test3')
