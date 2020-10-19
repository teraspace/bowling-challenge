class AddRollsToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :rolls, :integer
  end
end
