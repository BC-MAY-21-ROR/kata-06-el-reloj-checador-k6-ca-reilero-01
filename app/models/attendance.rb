# frozen_string_literal: true

class Attendance < ApplicationRecord
  validates :checkin, uniqueness: true
  validates :checkout, uniqueness: true

  belongs_to :employee
end
