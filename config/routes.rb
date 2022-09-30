# frozen_string_literal: true

Rails.application.routes.draw do
  get 'admin/index'
  devise_for :users

  resources :companies
  resources :employees
  resources :attendances
  resources :reports

  get '/admin', to: 'admin#index'
  get '/month', :to => 'attendances#month'

  root 'home#index'
end
