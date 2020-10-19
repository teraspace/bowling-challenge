Rails.application.routes.draw do
  get "/", to: "game#index"
  post "game/new", to: "game#create"
  resources :game
  devise_for :players
  namespace :api, defaults: {format: :json} do
    namespace :v1 do 
      devise_scope :player do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
