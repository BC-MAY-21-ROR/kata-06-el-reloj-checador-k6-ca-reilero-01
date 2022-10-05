# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true

  has_many :employee, dependent: :destroy
end
