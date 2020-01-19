class User < ApplicationRecord

    # include ActiveModel::Serializers::JSON

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
    # delegate :profile_pic_url, to: :profile_pic_url, allow_nil: true

    # has_secure_password takes care of this for us:
    # def authenticate(plaintext_password)
    #     if BCrypt::Password.new(self.password_digest) == plaintext_password
    #       self
    #     else
    #       false
    #     end
    # end

    def profile_pic_url
        if self.profile_pic_blob != nil
          url = Rails.application.routes.url_helpers.rails_blob_path(self.profile_pic, only_path: true)
        else
          return ''
        end
    end

end

