class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.boolean :current
      t.integer :patient_id

      t.timestamps
    end
  end
end
