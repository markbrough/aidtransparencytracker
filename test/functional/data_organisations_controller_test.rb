require 'test_helper'

class DataOrganisationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:data_organisations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create data_organisation" do
    assert_difference('DataOrganisation.count') do
      post :create, :data_organisation => { }
    end

    assert_redirected_to data_organisation_path(assigns(:data_organisation))
  end

  test "should show data_organisation" do
    get :show, :id => data_organisations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => data_organisations(:one).to_param
    assert_response :success
  end

  test "should update data_organisation" do
    put :update, :id => data_organisations(:one).to_param, :data_organisation => { }
    assert_redirected_to data_organisation_path(assigns(:data_organisation))
  end

  test "should destroy data_organisation" do
    assert_difference('DataOrganisation.count', -1) do
      delete :destroy, :id => data_organisations(:one).to_param
    end

    assert_redirected_to data_organisations_path
  end
end
