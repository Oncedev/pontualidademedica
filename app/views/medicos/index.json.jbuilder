json.array!(@medicos) do |m|
  json.extract! m[:medico], :id, :CRM, :nome
  json.atraso_medio m[:atraso_medio]
  json.url medico_url(m[:medico], format: :json)
end
