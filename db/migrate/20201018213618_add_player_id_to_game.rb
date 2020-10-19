class AddPlayerIdToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :player_id, :integer
  end
end
