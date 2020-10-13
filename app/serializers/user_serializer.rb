class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :title

  has_many :ledgers
  has_many :patients, through: :ledgers
end

