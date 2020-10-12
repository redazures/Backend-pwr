class LedgerSerializer < ActiveModel::Serializer
  attributes :id, :current_room, :description
end