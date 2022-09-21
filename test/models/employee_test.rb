# frozen_string_literal: true

require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  test 'validation' do
    employee = Employee.new
    assert_not employee.save, 'saved company without name, email, position, private_number'
  end
  test 'validation number of private_number' do
    assert_equal Integer, employees(:one).private_number.class, 'comparate private number'
  end
end
