class AddFinishedToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :finished, :boolean, :default => false
  end
end
