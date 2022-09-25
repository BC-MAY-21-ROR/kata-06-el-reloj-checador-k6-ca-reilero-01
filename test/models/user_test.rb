require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @user_2 = User.new
  end

  test 'invalid user' do
    refute @user_2.valid?
  end

  test 'validation admin ' do
    assert @user.valid?, 'no user valid'
  end

  test 'invalidated without email' do
    @user.email = nil
    refute @user.valid? , ' saved user without email'
    assert_not_nil @user.errors[:email], 'no validate error for email present'
  end 
end
