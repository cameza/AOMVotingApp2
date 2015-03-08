require 'test_helper'

class NomineesControllerTest < ActionController::TestCase
  setup do
    @nominee = nominees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nominees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nominee" do
    assert_difference('Nominee.count') do
      post :create, nominee: { abstained: @nominee.abstained, chairman_check: @nominee.chairman_check, committee_check: @nominee.committee_check, confirmed: @nominee.confirmed, cv: @nominee.cv, mail: @nominee.mail, name: @nominee.name, not_confirmed: @nominee.not_confirmed, statement: @nominee.statement }
    end

    assert_redirected_to nominee_path(assigns(:nominee))
  end

  test "should show nominee" do
    get :show, id: @nominee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nominee
    assert_response :success
  end

  test "should update nominee" do
    patch :update, id: @nominee, nominee: { abstained: @nominee.abstained, chairman_check: @nominee.chairman_check, committee_check: @nominee.committee_check, confirmed: @nominee.confirmed, cv: @nominee.cv, mail: @nominee.mail, name: @nominee.name, not_confirmed: @nominee.not_confirmed, statement: @nominee.statement }
    assert_redirected_to nominee_path(assigns(:nominee))
  end

  test "should destroy nominee" do
    assert_difference('Nominee.count', -1) do
      delete :destroy, id: @nominee
    end

    assert_redirected_to nominees_path
  end
end
