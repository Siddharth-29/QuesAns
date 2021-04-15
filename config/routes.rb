Rails.application.routes.draw do
  root 'home#index'
  resources :questions do 
    resources :answers
  end
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  post '/questions/new'
  resources :people
  post '/people/set_authentication'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
