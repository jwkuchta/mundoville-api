class Message < ApplicationRecord

    belongs_to :exchange
    belongs_to :user
    validates_presence_of :body, :exchange_id, :user_id
    
end
