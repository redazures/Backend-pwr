class Patient < ApplicationRecord
    has_many :ledgers
    has_many :users, through: :ledgers

    def self.current_patients
        Patient.where(current: true)
    end

    def room
        if self.ledgers.length==0
            101
        else
            self.ledgers.last.current_room
        end
    end

    def main_practitioner
        if self.ledgers.length==0
            "waiting to be assigned"
        else
            self.ledgers.first.user.name
        end
    end

    def main_practitioner_title
        if self.ledgers.length==0
            ""
        else
            self.ledgers.first.user.title
        end
    end

end
