json_array = {
  numero_paginas: @num_paginas,
  medicos: @medicos.map do |m|
    {
      id: m[:medico][:id],
      CRM: m[:medico][:CRM],
      nome: m[:medico][:nome],
      atraso_medio: m[:atraso_medio],
      numero_consultas: m[:numero_consultas],
      url: medico_url(m[:medico], format: :json)
    }
  end
}

json.extract! json_array, :numero_paginas, :medicos
