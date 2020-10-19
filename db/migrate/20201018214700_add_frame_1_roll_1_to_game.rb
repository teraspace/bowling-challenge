class AddFrame1Roll1ToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :frame_1_roll_1, :integer
    add_column :games, :frame_1_roll_2, :integer
    add_column :games, :frame_2_roll_1, :integer
    add_column :games, :frame_2_roll_2, :integer
    add_column :games, :frame_3_roll_1, :integer
    add_column :games, :frame_3_roll_2, :integer
    add_column :games, :frame_4_roll_1, :integer
    add_column :games, :frame_4_roll_2, :integer
    add_column :games, :frame_5_roll_1, :integer
    add_column :games, :frame_5_roll_2, :integer
    add_column :games, :frame_6_roll_1, :integer
    add_column :games, :frame_6_roll_2, :integer
    add_column :games, :frame_7_roll_1, :integer
    add_column :games, :frame_7_roll_2, :integer
    add_column :games, :frame_8_roll_1, :integer
    add_column :games, :frame_8_roll_2, :integer
    add_column :games, :frame_9_roll_1, :integer
    add_column :games, :frame_9_roll_2, :integer
    add_column :games, :frame_10_roll_1, :integer
    add_column :games, :frame_10_roll_2, :integer
    add_column :games, :frame_10_roll_3, :integer

    add_column :games, :frame_1_total, :integer
    add_column :games, :frame_2_total, :integer
    add_column :games, :frame_3_total, :integer
    add_column :games, :frame_4_total, :integer
    add_column :games, :frame_5_total, :integer
    add_column :games, :frame_6_total, :integer
    add_column :games, :frame_7_total, :integer
    add_column :games, :frame_8_total, :integer
    add_column :games, :frame_9_total, :integer
    add_column :games, :frame_10_total, :integer

  end
end
