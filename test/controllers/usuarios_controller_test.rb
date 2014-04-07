require 'test_helper'

class UsuariosControllerTest < ActionController::TestCase
  setup do
    @usuario = usuarios(:fulano)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuario" do
    assert_difference('Usuario.count') do
      post :create, usuario: { email: @usuario.email, nome: @usuario.nome, senha: @usuario.senha }
    end

    assert_redirected_to usuario_path(assigns(:usuario))
  end
end
