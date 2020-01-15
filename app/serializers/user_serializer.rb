class UserSerializer < ActiveModel::Serializer
    attributes :username, :first_name, :last_name, :bio, :email, :password_digest, :frienders, :friendeds
end