class CreateMedicos < ActiveRecord::Migration
  def change
    create_table :medicos do |t|
      t.integer :CRM
      t.string :nome

      t.timestamps
    end
  end
end
