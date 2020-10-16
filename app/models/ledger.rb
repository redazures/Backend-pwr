class Ledger < ApplicationRecord
    belongs_to :patient
    belongs_to :user
    has_one_attached :main_image
end
