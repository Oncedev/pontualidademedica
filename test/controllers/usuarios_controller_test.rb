require 'test_helper'

class UsuariosControllerTest < ActionController::TestCase
  setup do
    @usuario = usuarios(:fulano)
    session[:usuario] = nil
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuario" do
    assert_difference('Usuario.count') do
      post :create, usuario: { email: "eu@eu.eu.eu", nome: "Eu", senha: "eu" }
    end

    assert_redirected_to controller: "medicos", action: "index"
  end
end
