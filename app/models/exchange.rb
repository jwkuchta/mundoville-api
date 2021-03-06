class Exchange < ApplicationRecord

    belongs_to :first_user, foreign_key: :first_user_id, class_name: 'User'
    belongs_to :second_user, foreign_key: :second_user_id, class_name: 'User'
    has_many :messages, dependent: :destroy
    accepts_nested_attributes_for :messages
    validates_uniqueness_of :first_user_id, scope: :second_user_id

    scope :between, -> (first_user_id, second_user_id) do
        where("(exchanges.first_user_id = ? AND exchanges.second_user_id = ?) OR (exchanges.second_user_id = ? AND exchanges.first_user_id = ?)", first_user_id, second_user_id, first_user_id, second_user_id)
    end
end
