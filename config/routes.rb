Rails.application.routes.draw do
  root 'home#index'
  resources :questions do 
    resources :answers
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
