Rails.application.routes.draw do
  get :status_check, :to => "api#status_check"
end
