require 'test_helper'

class ProfileUsersControllerTest < ActionController::TestCase
  setup do
    @profile_user = profile_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_user" do
    assert_difference('ProfileUser.count') do
      post :create, profile_user: { company_name: @profile_user.company_name, diplomas: @profile_user.diplomas, first_name: @profile_user.first_name, industry_domain: @profile_user.industry_domain, languages_spoken: @profile_user.languages_spoken, last_name: @profile_user.last_name, location: @profile_user.location, phone_number: @profile_user.phone_number, promotion_id: @profile_user.promotion_id, skills: @profile_user.skills }
    end

    assert_redirected_to profile_user_path(assigns(:profile_user))
  end

  test "should show profile_user" do
    get :show, id: @profile_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_user
    assert_response :success
  end

  test "should update profile_user" do
    patch :update, id: @profile_user, profile_user: { company_name: @profile_user.company_name, diplomas: @profile_user.diplomas, first_name: @profile_user.first_name, industry_domain: @profile_user.industry_domain, languages_spoken: @profile_user.languages_spoken, last_name: @profile_user.last_name, location: @profile_user.location, phone_number: @profile_user.phone_number, promotion_id: @profile_user.promotion_id, skills: @profile_user.skills }
    assert_redirected_to profile_user_path(assigns(:profile_user))
  end

  test "should destroy profile_user" do
    assert_difference('ProfileUser.count', -1) do
      delete :destroy, id: @profile_user
    end

    assert_redirected_to profile_users_path
  end
end
