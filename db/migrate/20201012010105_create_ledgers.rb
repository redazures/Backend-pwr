class CreateLedgers < ActiveRecord::Migration[6.0]
  def change
    create_table :ledgers do |t|
      t.integer :user_id
      t.integer :patient_id
      t.integer :current_room
      t.text :description

      t.timestamps
    end
  end
end
