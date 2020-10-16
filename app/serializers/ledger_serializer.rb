class LedgerSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :current_room, :description, :main_image, :created_at, :user 
  
  belongs_to :user
  belongs_to :patient
end