Rails.application.routes.draw do
  get :status_check, :to => "api#status_check"

  namespace :api do
    post 'authenticate', :to => 'authentication#authenticate'
  end
end
