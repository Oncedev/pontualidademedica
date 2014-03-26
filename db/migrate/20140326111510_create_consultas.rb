class CreateConsultas < ActiveRecord::Migration
  def change
    create_table :consultas do |t|
      t.integer :medico_id
      t.integer :usuario_id
      t.datetime :hora_marcacao
      t.datetime :hora_atendimento
      t.boolean :anonimo

      t.timestamps
    end
  end
end
