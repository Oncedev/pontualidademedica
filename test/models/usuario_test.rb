require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  test "usuario vazio" do
    usuario = Usuario.new
    assert !usuario.save, "Salvou usuario vazio"
  end
end
