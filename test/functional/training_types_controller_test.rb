require 'test_helper'

class TrainingTypesControllerTest < ActionController::TestCase
  setup do
    @training_type = training_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:training_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create training_type" do
    assert_difference('TrainingType.count') do
      post :create, :training_type => @training_type.attributes
    end

    assert_redirected_to training_type_path(assigns(:training_type))
  end

  test "should show training_type" do
    get :show, :id => @training_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @training_type.to_param
    assert_response :success
  end

  test "should update training_type" do
    put :update, :id => @training_type.to_param, :training_type => @training_type.attributes
    assert_redirected_to training_type_path(assigns(:training_type))
  end

  test "should destroy training_type" do
    assert_difference('TrainingType.count', -1) do
      delete :destroy, :id => @training_type.to_param
    end

    assert_redirected_to training_types_path
  end
end
