class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer :game_id
      t.string :color
      t.integer :location
      t.string :type
      t.string :dead

      t.timestamps
    end
  end
end
