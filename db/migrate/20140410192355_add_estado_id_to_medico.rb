class AddEstadoIdToMedico < ActiveRecord::Migration
  def change
    add_column :medicos, :estado_id, :integer
  end
end
