Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      devise_scope :user do
        post "sign_in", to: "sessions#create"
        delete "sign_out", to: "sessions#destroy"
        post "sign_up", to: "registrations#create"
      end

      # devise_for :users, controllers: { omniauth_callbacks: 'auth/callbacks' }

      post "facebook", to: "users#facebook"
    end
  end
end
