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
      post :create, usuario: {
        email: "eu@eu.eu.eu",
        nome: "Eu",
        senha: "eu",
        senha_confirmation: "eu"
      }
    end

    assert_redirected_to controller: "medicos", action: "index"
    assert !session[:usuario].nil?, "Nenhum usuario logado depois de cadastro de usuario"
  end
end
