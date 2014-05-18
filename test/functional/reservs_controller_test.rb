require 'test_helper'

class ReservsControllerTest < ActionController::TestCase
  setup do
    @reserv = reservs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reserv" do
    assert_difference('Reserv.count') do
      post :create, reserv: @reserv.attributes
    end

    assert_redirected_to reserv_path(assigns(:reserv))
  end

  test "should show reserv" do
    get :show, id: @reserv
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reserv
    assert_response :success
  end

  test "should update reserv" do
    put :update, id: @reserv, reserv: @reserv.attributes
    assert_redirected_to reserv_path(assigns(:reserv))
  end

  test "should destroy reserv" do
    assert_difference('Reserv.count', -1) do
      delete :destroy, id: @reserv
    end

    assert_redirected_to reservs_path
  end
end
