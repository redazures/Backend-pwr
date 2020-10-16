class Ledger < ApplicationRecord
    belongs_to :patient
    belongs_to :user
    has_one_attached :featured_image
end
