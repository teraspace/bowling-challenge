class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games

  #One game per time; making sure that only one is unfinished
  def create_game
    if !self.games.where(finished: false).present?
      self.games.create
    end
    #self.games.last
  end
  def current_game
    self.games.last
  end
end
