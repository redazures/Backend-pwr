class AddCellToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cell, :bigint
  end
end
