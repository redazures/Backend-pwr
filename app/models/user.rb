class User < ApplicationRecord
    has_many :ledgers
    has_many :patients, through: :ledgers
    
end
