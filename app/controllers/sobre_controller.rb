class SobreController < ApplicationController
  def index
    @titulo = "O que é Pontualidade Médica?"
    @paragrafos = [
      "\"Pontualidade Médica\" permite o registro de ocorrências de atraso " +
      "de atendimento por parte dos médicos pelos pacientes.",
      "A página inicial exibe uma lista de médicos ordenados por tempo médio de " +
      "de atraso das consultas reclamadas." +
      "Para registrar uma ocorrência de atraso, basta criar uma conta e " +
      "reclamar. Informe o nome e o CRM do médico, data da consulta, hora " +
      "marcada, hora em que você foi atendido e pronto: a reclamação estará " +
      "registrada e o médico, se já não estava na lista, aparecerá nela.",
      "Esta ainda é uma versão preliminar de testes do \"Pontualidade Médica\", " +
      "então algumas coisas podem estar faltando ou não funcionar corretamente."
    ]
  end
end
