class ChangeCrmToString < ActiveRecord::Migration
  def change
    change_column :medicos, :CRM, :string
  end
end
