class Company < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :address, presence: true

    has_many :employee
end
