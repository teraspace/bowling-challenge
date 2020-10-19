class Api::V1::SessionsController < Devise::SessionsController
    before_action :verify_authenticity_token, :except => :create
    before_action :sign_in_params, only: :create
    before_action :load_player, only: :create
    # sign in
    def create
      if @player.valid_password?(sign_in_params[:password])
        sign_in "player", @player
        render json: {
          messages: "Signed In Successfully",
          is_success: true,
          data: {player: @player}
        }, status: :ok
      else
        render json: {
          messages: "Signed In Failed - Unauthorized",
          is_success: false,
          data: {}
        }, status: :unauthorized
      end
    end
  
    private
    def sign_in_params
      params.require(:player).permit :email, :password
    end
  
    def load_player
      @player = Player.find_for_database_authentication(email: sign_in_params[:email])
      if @player
        return @player
      else
        render json: {
          messages: "Cannot get Player",
          is_success: false,
          data: {}
        }, status: :failure
      end
    end
    def current_player
      @player
    end
  end