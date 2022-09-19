# frozen_string_literal: true

require 'test_helper'

class AttendanceTest < ActiveSupport::TestCase
  test 'validation' do
    assert_not_equal attendances(:two).checkin, attendances(:three).checkin, 'comparate uniqueness'
  end
end
