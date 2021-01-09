require "application_system_test_case"

class UserSpecialtiesTest < ApplicationSystemTestCase
  setup do
    @user_specialty = user_specialties(:one)
  end

  test "visiting the index" do
    visit user_specialties_url
    assert_selector "h1", text: "User Specialties"
  end

  test "creating a User specialty" do
    visit user_specialties_url
    click_on "New User Specialty"

    fill_in "Specialty", with: @user_specialty.specialty_id
    fill_in "User", with: @user_specialty.user_id
    click_on "Create User specialty"

    assert_text "User specialty was successfully created"
    click_on "Back"
  end

  test "updating a User specialty" do
    visit user_specialties_url
    click_on "Edit", match: :first

    fill_in "Specialty", with: @user_specialty.specialty_id
    fill_in "User", with: @user_specialty.user_id
    click_on "Update User specialty"

    assert_text "User specialty was successfully updated"
    click_on "Back"
  end

  test "destroying a User specialty" do
    visit user_specialties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User specialty was successfully destroyed"
  end
end
