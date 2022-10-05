# frozen_string_literal: true

class Employee < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :position, presence: true
  validates :private_number, presence: true, uniqueness: true
  validates_numericality_of :private_number, message: 'Error Message'

  belongs_to :company
  has_many :attendance, dependent: :destroy
end
