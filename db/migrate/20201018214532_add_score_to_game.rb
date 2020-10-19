class AddScoreToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :score, :integer
  end
end
