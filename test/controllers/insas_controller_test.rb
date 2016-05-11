require 'test_helper'

class InsasControllerTest < ActionController::TestCase
  setup do
    @insa = insas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insa" do
    assert_difference('Insa.count') do
      post :create, insa: { location: @insa.location, name: @insa.name }
    end

    assert_redirected_to insa_path(assigns(:insa))
  end

  test "should show insa" do
    get :show, id: @insa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @insa
    assert_response :success
  end

  test "should update insa" do
    patch :update, id: @insa, insa: { location: @insa.location, name: @insa.name }
    assert_redirected_to insa_path(assigns(:insa))
  end

  test "should destroy insa" do
    assert_difference('Insa.count', -1) do
      delete :destroy, id: @insa
    end

    assert_redirected_to insas_path
  end
end
