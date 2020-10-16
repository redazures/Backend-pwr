class Ledger < ApplicationRecord
    belongs_to :patient
    belongs_to :user
    has_many_attached :images

    # rails_blob_path(user.avatar, disposition: "attachment")
    # Rails.application.routes.url_helpers.rails_blob_path(image, disposition: "attachment", only_path: true)

    def array_of_images
        images = self.images.map do|image|
            Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)
        end
    end

    def practitioner
        self.user.name
    end

    def practitioner_title
        self.user.title
    end

    def edit
        self.updated_at.to_i - self.created_at.to_i > 100 ? true : false
    end

end
