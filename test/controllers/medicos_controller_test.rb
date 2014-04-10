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

  test "procurar por CRM" do
    get "index", format: :json, CRM_ou_nome: "123456"
    assert_response :success
    assert JSON.parse(response.body)["medicos"].size == 1, "Nao achou medico"
  end
end
