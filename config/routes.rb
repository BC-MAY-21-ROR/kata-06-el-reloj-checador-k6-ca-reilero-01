# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :companies
  resources :employees

  root 'home#index'
end
