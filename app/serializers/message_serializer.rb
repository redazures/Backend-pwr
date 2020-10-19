class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :sender_id, :recipient_id
end
