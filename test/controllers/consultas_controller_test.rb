require 'test_helper'

class ConsultasControllerTest < ActionController::TestCase
  setup do
    @consulta = consultas(:one)
    @medico = medicos(:carlos)
    session[:usuario] = usuarios(:fulano)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consulta" do
    assert_difference('Consulta.count') do
      post(
        :create,
        consulta: {
          anonimo: @consulta.anonimo,
          data_consulta: @consulta.data_consulta,
          hora_atendimento: @consulta.hora_atendimento,
          hora_marcacao: @consulta.hora_marcacao
        },
        CRM_medico: @medico.CRM,
        nome_medico: @medico.nome
      )
    end

    assert_redirected_to controller: "medicos", action: "index"
  end
end
