class AddDataConsultaToConsulta < ActiveRecord::Migration
  def change
    add_column :consultas, :data_consulta, :date
  end
end
