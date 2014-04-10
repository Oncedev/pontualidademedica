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

  test "hora de atendimento no passado" do
    t = Time.new

    consulta = Consulta.new(
      data_consulta: Date.new(2012, 2, 8),
      hora_marcacao: t,
      hora_atendimento: t - 600,
      anonimo: true,
      medico: medicos(:carlos),
      usuario: usuarios(:beltrano)
    )
    assert !consulta.save, "Salvou consulta com atendimento antes da marcacao"
  end

  test "data no futuro" do
    d = Date.today + 1 # Amanhã

    consulta = Consulta.new(
      data_consulta: d,
      hora_marcacao: Time.new,
      hora_atendimento: Time.new,
      anonimo: true,
      medico: medicos(:carlos),
      usuario: usuarios(:beltrano)
    )
    assert !consulta.save, "Data no futuro"
  end

  test "hora no futuro" do
    d = Date.today
    t = Time.now + 60
    t2 = t + 60

    assert !Consulta.new(
      data_consulta: d,
      hora_marcacao: t,
      hora_atendimento: t2,
      anonimo: true,
      medico: medicos(:carlos),
      usuario: usuarios(:beltrano)
    ).save, "Hora no futuro"
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
