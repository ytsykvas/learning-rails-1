# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'
  post 'file' => 'customers#file'
  get 'new' => 'customers#new'
  get 'success' => 'pages#success'
  get 'file_form' => 'customers#file_form'
  resources :customers

  resources :accounts do
    resources :transactions
  end
  
end
