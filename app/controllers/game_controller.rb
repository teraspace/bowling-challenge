class GameController < ApplicationController
  def index
    @games = Game.all
  end
  def new


  end

  def create
    rolls_series = params[:rolls].split(',')
    p rolls_series
    current_player.games.create
    pins = 0
    rolls_series.each_with_index do |r,i|
      pins = r.to_i
      if r=='X'
        pins = 10
      end
      if r=='/'
        pins = 10 - rolls_series[i-1].to_i
      end
      if r=='-'
        pins = 0
      end
      
      current_player.current_game.play(pins)
    end
    redirect_to '/game'
  end
end
