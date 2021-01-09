require 'test_helper'

class UserSpecialtiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_specialty = user_specialties(:one)
  end

  test "should get index" do
    get user_specialties_url
    assert_response :success
  end

  test "should get new" do
    get new_user_specialty_url
    assert_response :success
  end

  test "should create user_specialty" do
    assert_difference('UserSpecialty.count') do
      post user_specialties_url, params: { user_specialty: { specialty_id: @user_specialty.specialty_id, user_id: @user_specialty.user_id } }
    end

    assert_redirected_to user_specialty_url(UserSpecialty.last)
  end

  test "should show user_specialty" do
    get user_specialty_url(@user_specialty)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_specialty_url(@user_specialty)
    assert_response :success
  end

  test "should update user_specialty" do
    patch user_specialty_url(@user_specialty), params: { user_specialty: { specialty_id: @user_specialty.specialty_id, user_id: @user_specialty.user_id } }
    assert_redirected_to user_specialty_url(@user_specialty)
  end

  test "should destroy user_specialty" do
    assert_difference('UserSpecialty.count', -1) do
      delete user_specialty_url(@user_specialty)
    end

    assert_redirected_to user_specialties_url
  end
end
