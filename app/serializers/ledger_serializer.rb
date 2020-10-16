class LedgerSerializer < ActiveModel::Serializer
  attributes :id, :current_room, :description, :created_at, :main_image,:user 
  include Rails.application.routes.url_helpers

  belongs_to :user
  belongs_to :patient

  def main_image
    if object.main_image.attached?
      {
        url: rails_blob_url(object.main_image)
      }
    end
  end
end