class ChangeHorasToTime < ActiveRecord::Migration
  def change
    change_column :consultas, :hora_marcacao, :time
    change_column :consultas, :hora_atendimento, :time
  end
end
