class AddNomePesquisavelToMedico < ActiveRecord::Migration
  def change
    add_column :medicos, :nome_pesquisavel, :string
  end
end
