class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :profile_pic_url, 
  :bio, :email, :country, :city, :language1, :language2, :language3, 
  :friends, :friendeds, :reviews
  include Rails.application.routes.url_helpers

  # def image
  #   return unless self.profile_pic.attached?

  #   self.profile_pic.blob.attributes
  #         .slice('filename', 'byte_size')
  #         .merge(url: image_url)
  #         .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  # end

  # def image_url
  #   url_for(self.profile_pic)
  # end

  # def profile_pic_url
  #   if self.profile_pic.attached?
  #     Rails.application.routes.url_helpers.rails_blob_path(self.profile_pic, only_path: true)
  #     # url = "https://49a21af3.ngrok.io" + short_url
  #   else 
  #     return ''
  #   end
  # end

end
