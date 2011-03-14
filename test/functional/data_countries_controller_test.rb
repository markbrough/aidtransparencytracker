require 'test_helper'

class DataCountriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:data_countries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create data_country" do
    assert_difference('DataCountry.count') do
      post :create, :data_country => { }
    end

    assert_redirected_to data_country_path(assigns(:data_country))
  end

  test "should show data_country" do
    get :show, :id => data_countries(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => data_countries(:one).to_param
    assert_response :success
  end

  test "should update data_country" do
    put :update, :id => data_countries(:one).to_param, :data_country => { }
    assert_redirected_to data_country_path(assigns(:data_country))
  end

  test "should destroy data_country" do
    assert_difference('DataCountry.count', -1) do
      delete :destroy, :id => data_countries(:one).to_param
    end

    assert_redirected_to data_countries_path
  end
end
