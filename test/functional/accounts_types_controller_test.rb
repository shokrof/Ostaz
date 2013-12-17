require 'test_helper'

class AccountsTypesControllerTest < ActionController::TestCase
  setup do
    @accounts_type = accounts_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounts_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accounts_type" do
    assert_difference('AccountsType.count') do
      post :create, accounts_type: { name: @accounts_type.name, sign: @accounts_type.sign }
    end

    assert_redirected_to accounts_type_path(assigns(:accounts_type))
  end

  test "should show accounts_type" do
    get :show, id: @accounts_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accounts_type
    assert_response :success
  end

  test "should update accounts_type" do
    put :update, id: @accounts_type, accounts_type: { name: @accounts_type.name, sign: @accounts_type.sign }
    assert_redirected_to accounts_type_path(assigns(:accounts_type))
  end

  test "should destroy accounts_type" do
    assert_difference('AccountsType.count', -1) do
      delete :destroy, id: @accounts_type
    end

    assert_redirected_to accounts_types_path
  end
end
