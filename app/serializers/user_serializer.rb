class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :title, :sender_messages, :recipient_messages

  # has_many :messages
  has_many :sender_messages
  has_many :recipient_messages

  # has_many :ledgers
  # has_many :patients, through: :ledgers
end

