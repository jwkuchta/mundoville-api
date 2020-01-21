class Friendship < ApplicationRecord

    belongs_to :friender, foreign_key: 'user_id', class_name: 'User'
    belongs_to :friended, foreign_key: 'friended_id', class_name: 'User'
    
end
