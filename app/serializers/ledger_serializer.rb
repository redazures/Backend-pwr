class LedgerSerializer < ActiveModel::Serializer
  attributes :id, :current_room, :description, :created_at, :updated_at, :image, :practitioner, :practitioner_title

  belongs_to :user
  belongs_to :patient

  def image
    if object.main_image.attached?
      {
        url: object.image
      }
    end
  end
end