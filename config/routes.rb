Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  root to: "charities#index"

  resources :users
  resources :charities do
    resources :donations
  end
end
