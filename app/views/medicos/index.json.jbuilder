json.array!(@medicos) do |medico|
  json.extract! medico, :id, :CRM, :nome
  json.url medico_url(medico, format: :json)
end
