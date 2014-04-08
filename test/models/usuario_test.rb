require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  test "usuario vazio" do
    usuario = Usuario.new
    assert !usuario.save, "Salvou usuario vazio"
  end

  test "nome locuo" do
    usuario = Usuario.new nome: "<h1>Otario</h1>", email: "o@tar.io", senha: "1111"
    assert !usuario.save, "Salvou usuario com nome estanho"
  end

  test "email sem email" do
    usuario = Usuario.new nome: "Bonitinho", email: "aaa", senha: "slknsjn"
    assert !usuario.save, "Salvou email mal formatado"
  end
end
