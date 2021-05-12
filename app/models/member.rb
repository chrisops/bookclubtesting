class Member < ApplicationRecord
    validates_uniqueness_of :email
    has_one :address, dependent: destroy
end
