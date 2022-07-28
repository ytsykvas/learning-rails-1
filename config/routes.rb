Rails.application.routes.draw do
  root to: 'pages#success'

  get 'success' => 'pages#success'
  resources :customers
end
