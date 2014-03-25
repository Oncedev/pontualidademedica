require 'test_helper'

class MedicoTest < ActiveSupport::TestCase
  test "medico sem nada" do
    medico = Medico.new
    assert !medico.save, "Medico vazio"
  end

  test "medico sem nome" do
    medico = Medico.new CRM: 1001
    assert !medico.save, "Medico sem nome"
  end

  test "medico sem crm" do
    medico = Medico.new nome: "Alberto Costa"
    assert !medico.save, "Medico sem CRM"
  end
end
