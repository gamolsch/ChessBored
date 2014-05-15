class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :email
      t.string :access_token
      t.string :access_secret

      t.timestamps
    end
  end
end
