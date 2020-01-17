class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :bio, :email, :frienders, :friendeds
end
