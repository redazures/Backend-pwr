class LedgerSerializer < ActiveModel::Serializer
  attributes :id, :current_room, :description, :created_at, :user 
  
  belongs_to :user
  belongs_to :patient
end