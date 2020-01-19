class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :profile_pic_url, :bio, :email, :country, :city, :language1, :language2, :language3, :frienders, :friendeds

end
