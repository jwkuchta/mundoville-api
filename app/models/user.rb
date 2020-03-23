class User < ApplicationRecord

    include Rails.application.routes.url_helpers

    # has_secure_password
    # validates :username, uniqueness: {case_sensitive: false}
    validates :sub, uniqueness: {case_sensitive: false}
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, unless: lambda { self.email.blank? }
    # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
    
    # self-referential associations
    # friendship
    has_many :friends, class_name: 'Friendship', foreign_key: 'user_id'
    has_many :friendeds, class_name: 'Friendship', foreign_key: 'friend_id'
    has_many :friendships

    # review
    has_many :reviews, class_name: "Review", foreign_key: "reviewed_id"
    has_many :sent_reviews, class_name: "Review", foreign_key: "user_id"
    
    # active record associations
    has_many_attached :images
    has_one_attached :profile_pic
    delegate :profile_pic_url, to: :profile_pic_url, allow_nil: true

    def profile_pic_url
        if self.profile_pic_blob != nil
          Rails.application.routes.url_helpers.rails_blob_path(self.profile_pic, only_path: true)        
        else
          return ''
        end
    end

    def full_name
      if self.first_name && self.last_name
        self.first_name + " " + self.last_name
      else
        return nul
      end
    end

    def rating
      if self.reviews.length.to_i == 0
        return nil
      else
        total_rating = self.reviews.map {|r| r.rating}.sum.to_f
        num_of_reviews = self.reviews.length.to_f
        total_rating / num_of_reviews
      end
    end

end

