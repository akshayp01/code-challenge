require 'test_helper'

class CompanyTest < ActiveSupport::TestCase

  def setup
    @company = Company.new(name: "Test company", zip_code: "99950")
  end

  test "should not save company when email is invalid" do
    @company.email = "test@company.com"
    assert_not @company.save

    @company.email = "test@getmainstreet.com"
    assert @company.save
  end

  test "should save company when email is vaild" do
    @company.email = "test@getmainstreet.com"
    assert @company.save
  end

  test "should save even if email is blank" do
    @company.email = ""
    assert @company.save
  end

  test "should create city and state" do
    @company.save
    assert_not_nil @company.city
    assert_not_nil @company.state
  end

  test "city and state should change when zip is changed" do
    @company.save
    old_city = @company.city
    old_state = @company.state

    @company.zip_code = "99501"
    @company.save

    assert_not_equal  old_city, @company.city
    assert_not_equal  old_state, @company.city
  end

end