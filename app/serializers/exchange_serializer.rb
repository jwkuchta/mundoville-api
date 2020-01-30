class ExchangeSerializer < ActiveModel::Serializer

    attributes :id, :first_user_id, :second_user_id, :messages
  
end