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

  test "crm ja existente" do
    medico = Medico.new nome: "Rogerio da Mata", CRM: 123456
    assert !medico.save, "Medico com CRM ja existente salvo"
  end

  test "medico normal" do
    medico = Medico.new nome: "Roberta dos Santos", CRM: 1001
    assert medico.save, "Medico normal nao foi salvo"
  end

  test "CRM de letras" do
    medico = Medico.new nome: "Lucas", CRM: "O CRM do Lucas"
    assert !medico.save, "Salvou medico com CRM so de letras"
  end

  test "nome com numero" do
    medico = Medico.new nome: "123 de Oliveira", CRM: "12332"
    assert !medico.save, "Salvou um cara com o nome estranho"
  end
end
