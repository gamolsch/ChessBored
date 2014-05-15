class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :location
      t.integer :pieces_id

      t.timestamps
    end
  end
end
