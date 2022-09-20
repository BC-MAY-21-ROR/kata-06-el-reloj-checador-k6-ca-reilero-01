# frozen_string_literal: true

Rails.application.routes.draw do
  get 'employees', to: 'employees#index'

  resources :companies

  root 'home#index'
end
