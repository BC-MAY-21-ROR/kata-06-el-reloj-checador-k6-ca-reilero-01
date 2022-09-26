# frozen_string_literal: true

Rails.application.routes.draw do
  get 'admin/index'
  devise_for :users

  resources :companies
  resources :employees
  resources :attendances

  get '/admin', to: 'admin#index'

  get '/admin', to: 'admin#index'

  root 'home#index'
end
