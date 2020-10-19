class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :sender_id
      t.integer :recipient_id
      t.index [:sender_id, :recipient_id]
      t.index [:recipient_id,:sender_id]

      t.timestamps
    end
  end
end
