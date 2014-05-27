class AddObservacoesToConsulta < ActiveRecord::Migration
  def change
    add_column :consultas, :observacoes, :string
  end
end
