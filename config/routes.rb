Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get :status_check, :to => "status#status_check"

      resources :secret, only: :index

      resource :authentication, only: [] do
        post :authenticate
        post :register
      end
    end
  end
end
