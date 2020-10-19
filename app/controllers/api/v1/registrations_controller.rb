class Api::V1::RegistrationsController < Devise::RegistrationsController
    before_action :ensure_params_exist, only: :create
    before_action :verify_authenticity_token, :except => :create
    # sign up
    def create
      player = Player.new player_params
      if player.save
        render json: {
          messages: "Sign Up Successfully",
          is_success: true,
          data: {player: player}
        }, status: :ok
      else
        render json: {
          messages: "Sign Up Failded",
          is_success: false,
          data: {}
        }, status: :unprocessable_entity
      end
    end
  
    private
    def player_params
      params.require(:player).permit(:email, :password, :password_confirmation)
    end
  
    def ensure_params_exist
      return if params[:player].present?
      render json: {
          messages: "Missing Params",
          is_success: false,
          data: {}
        }, status: :bad_request
    end
  end