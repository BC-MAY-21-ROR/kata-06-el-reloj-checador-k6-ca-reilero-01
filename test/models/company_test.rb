# frozen_string_literal: true

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test 'validation' do
    company = Company.new
    assert_not company.save, 'saved company without name,adress'
  end

  test 'validation string namecompany' do
    assert_equal String, companies(:one).name.class, 'comparate name'
  end
end
