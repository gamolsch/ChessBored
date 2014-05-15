class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name, :provider, :uid, :oauth_token, :oauth_expires_at
      t.timestamps
    end
  end
end

