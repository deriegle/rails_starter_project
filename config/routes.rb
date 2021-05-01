Rails.application.routes.draw do
  get :status_check, :to => "api#status_check"

  namespace :api do
    namespace :v1 do
      resource :authentication, :only => [] do
        post :authenticate
        post :register
      end
    end
  end
end
