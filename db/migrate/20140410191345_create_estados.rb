class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :nome, limit: 2

      t.timestamps
    end
  end
end
