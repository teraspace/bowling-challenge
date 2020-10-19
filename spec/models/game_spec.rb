require 'rails_helper'
RSpec.describe Game, type: :model do
  before(:all) do
    @player = Player.new
    @game = nil
  end

  it "Create player is valid with valid attributes" do
    @player.email = "patmac_p@hotmail.com"
    @player.password = "12345678"
    @player.save
    expect(@player).to be_valid
  end

  it "Create Game is valid with valid attributes" do
    @player.create_game
    @game = @player.games.last
    expect(@player.games.last).to be_valid
  end

  it "Play with first recommended sample; 12 rolls with 12 strikes" do
    rolls_series = [10,10,10,10,10,10,10,10,10,10,10,10]
    @game = @player.games.create

    rolls_series.each do |roll|
      @game.play(roll)
    end

    expect(@game.score).to eq(300)
  end
  it "Play with second recommended sample; 20 rolls: 10 pairs of 9 and miss" do
    rolls_series = [9,0,9,0,9,0,9,0,9,0,9,0,9,0,9,0,9,0,9,0]
    @game = @player.games.create

    rolls_series.each do |roll|
      @game.play(roll)
    end

    expect(@game.score).to eq(90)
  end
  it "Play with third recommended sample;  ​21 rolls: 10 pairs of 5 and spare, with a final 5" do
    rolls_series = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]
    @game = @player.games.create

    rolls_series.each do |roll|
      @game.play(roll)
    end
    expect(@game.score).to eq(150)
  end
end
