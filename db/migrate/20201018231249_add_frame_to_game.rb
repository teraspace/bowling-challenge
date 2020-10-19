class AddFrameToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :frame, :integer
  end
end
