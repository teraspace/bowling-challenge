class ApplicationController < ActionController::Base
    #acts_as_token_authentication_handler_for Player
    before_action :authenticate_player!
end
