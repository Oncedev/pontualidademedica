json.array!(@consultas) do |consulta|
  json.extract! consulta, :id, :medico_id, :usuario_id, :hora_marcacao, :hora_atendimento, :anonimo
  json.url consulta_url(consulta, format: :json)
end
