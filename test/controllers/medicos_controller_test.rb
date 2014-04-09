require 'test_helper'

class MedicosControllerTest < ActionController::TestCase
  setup do
    @medico = medicos(:carlos)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicos)
  end
end
