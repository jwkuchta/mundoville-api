class User < ApplicationRecord

    has_secure_password
    validates :username, uniqueness: {case_sensitive: false}
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    
    # self-referential associations
    has_many :friendships
    has_many :friender_relationships, foreign_key: :friended_id, class_name: 'Friendship'
    has_many :frienders, through: :friender_relationships, source: :friender
    
    has_many :friended_relationships, foreign_key: :user_id, class_name: 'Friendship'  
    has_many :friendeds, through: :friended_relationships, source: :friended
    
    # active record associations
    has_many_attached :images
    has_one_attached :profile_pic

    # has_secure_password takes care of this for us:
    # def authenticate(plaintext_password)
    #     if BCrypt::Password.new(self.password_digest) == plaintext_password
    #       self
    #     else
    #       false
    #     end
    # end

end

