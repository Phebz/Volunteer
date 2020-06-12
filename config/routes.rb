Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
