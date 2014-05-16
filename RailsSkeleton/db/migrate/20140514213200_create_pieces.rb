class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer :game_id
      t.string :color
      t.integer :location
      t.string :piece_type
      t.boolean :dead
      t.boolean :moved
      t.timestamps
    end
  end
end
