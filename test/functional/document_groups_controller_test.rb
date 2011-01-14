require 'test_helper'

class DocumentGroupsControllerTest < ActionController::TestCase
  setup do
    @document_group = document_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:document_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create document_group" do
    assert_difference('DocumentGroup.count') do
      post :create, :document_group => @document_group.attributes
    end

    assert_redirected_to document_group_path(assigns(:document_group))
  end

  test "should show document_group" do
    get :show, :id => @document_group.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @document_group.to_param
    assert_response :success
  end

  test "should update document_group" do
    put :update, :id => @document_group.to_param, :document_group => @document_group.attributes
    assert_redirected_to document_group_path(assigns(:document_group))
  end

  test "should destroy document_group" do
    assert_difference('DocumentGroup.count', -1) do
      delete :destroy, :id => @document_group.to_param
    end

    assert_redirected_to document_groups_path
  end
end
