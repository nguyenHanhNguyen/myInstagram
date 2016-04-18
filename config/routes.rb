Rails.application.routes.draw do
  devise_for :users
  # generate routes for pics
  resources :pics
  # set the root of the application
  root "pics#index"
end
