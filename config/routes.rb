# frozen_string_literal: true

Rails.application.routes.draw do
  get 'companies', to: 'companies#index'
  get 'employees', to: 'employees#index'
  get 'companies/new'
  get 'companies/:id', to: 'companies#show', as:'show_company'
  get 'companies/:id/edit', to: 'companies#edit', as:'edit_company'
  post 'companies', to: 'companies#create'
  delete 'companies/:id', to: 'companies#destroy', as:'delete_company'
  patch 'companies/:id', to: 'companies#update', as:'company'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'home#index'
end
