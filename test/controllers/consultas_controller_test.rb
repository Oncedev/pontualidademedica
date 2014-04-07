require 'test_helper'

class ConsultasControllerTest < ActionController::TestCase
  setup do
    @consulta = consultas(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consulta" do
    assert_difference('Consulta.count') do
      post :create, consulta: { anonimo: @consulta.anonimo, hora_atendimento: @consulta.hora_atendimento, hora_marcacao: @consulta.hora_marcacao, medico_id: @consulta.medico_id, usuario_id: @consulta.usuario_id }
    end

    assert_redirected_to consulta_path(assigns(:consulta))
  end
end
