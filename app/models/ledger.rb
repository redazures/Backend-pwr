class Ledger < ApplicationRecord
    belongs_to :patient
    belongs_to :user
end
