# frozen_string_literal: true

class Attendance < ApplicationRecord
 
  belongs_to :employee

  ransacker :created_at do
    Arel.sql('date(created_at)')
  end
  
end
