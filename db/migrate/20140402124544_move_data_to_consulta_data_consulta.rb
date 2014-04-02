class MoveDataToConsultaDataConsulta < ActiveRecord::Migration
  def change
    Consulta.all.each do |c|
      c.data_consulta = c.hora_marcacao.to_time
      c.save
    end
  end
end
