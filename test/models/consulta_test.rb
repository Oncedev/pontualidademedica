require 'test_helper'

class ConsultaTest < ActiveSupport::TestCase
  test "consulta vazia" do
    consulta = Consulta.new
    assert !consulta.save, "Salvou consulta vazia"
  end

  test "consulta sem medico" do
    consulta = Consulta.new(
      hora_marcacao: DateTime.now,
      hora_atendimento: DateTime.now,
      anonimo: true,
      usuario: Usuario.find_by(nome: "Fulano")
    )
    assert !consulta.save, "Salvou consulta sem medico"
  end

  test "consulta sem usuario" do
    consulta = Consulta.new(
      hora_marcacao: DateTime.now,
      hora_atendimento: DateTime.now,
      anonimo: false,
      medico: medicos(:carlos)
    )
    assert !consulta.save, "Salvou consulta sem usuario"
  end

  test "consulta sem marcacao" do
    consulta = Consulta.new(
      hora_atendimento: DateTime.now,
      anonimo: true,
      medico: medicos(:carlos),
      usuario: usuarios(:beltrano)
    )
    assert !consulta.save, "Salvou consulta sem marcacao"
  end

  test "consulta sem atendimento" do
    consulta = Consulta.new(
      hora_marcacao: DateTime.now,
      anonimo: false,
      medico: medicos(:carlos),
      usuario: usuarios(:beltrano)
    )
    assert !consulta.save, "Salvou consulta sem atendimento"
  end

  test "consulta sem anonimo" do
    consulta = Consulta.new(
      hora_atendimento: DateTime.now,
      hora_marcacao: DateTime.now,
      medico: medicos(:carlos),
      usuario: usuarios(:beltrano)
    )
    assert !consulta.save, "Salvou consulta sem anonimo"
  end

  test "consulta normal" do
    consulta = Consulta.new(
      data_consulta: Date.new(2012, 2, 8),
      hora_marcacao: Time.now,
      hora_atendimento: Time.now,
      anonimo: true,
      usuario: usuarios(:fulano),
      medico: medicos(:carlos)
    )
    assert consulta.save, "Nao salvou consulta normal"
  end
end
