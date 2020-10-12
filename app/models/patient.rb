class Patient < ApplicationRecord
    has_many :ledgers
    has_many :users, through: :ledgers

    def self.current_patients
        Patient.where(current: true)
    end

end
