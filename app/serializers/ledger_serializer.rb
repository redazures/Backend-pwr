class LedgerSerializer < ActiveModel::Serializer
  attributes :id, :current_room, :description, :created_at, :updated_at, :practitioner, :practitioner_title, :edit, 
  # :array_of_images

  belongs_to :user
  belongs_to :patient

  # def array_images
  #   if object.images.attached?
  #         object.images.map do |image|
  #             {
  #               url: object.image
  #             }
  #         end
  #   end
  # end
end