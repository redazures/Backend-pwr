class Ledger < ApplicationRecord
    belongs_to :patient
    belongs_to :user
    has_one_attached :main_image
# rails_blob_path(user.avatar, disposition: "attachment")
# Rails.application.routes.url_helpers.rails_blob_path(image, disposition: "attachment", only_path: true)
    def image
        image = self.main_image
        Rails.application.routes.url_helpers.rails_blob_path(image, disposition: "attachment", only_path: true)
    end

    def practitioner
        self.user.name
    end

    def practitioner_title
        self.user.title
    end

end
