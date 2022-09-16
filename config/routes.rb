# frozen_string_literal: true

Rails.application.routes.draw do

  # url companies
  get 'companies/new'
  get 'companies', to: 'companies#index'
  get 'companies/:id', to: 'companies#show', as:'show_company'
  get 'companies/:id/edit', to: 'companies#edit', as:'edit_company'
  post 'companies', to: 'companies#create'
  delete 'companies/:id', to: 'companies#destroy', as:'delete_company'
  patch 'companies/:id', to: 'companies#update', as:'company'
  # url employees
  get 'employees', to: 'employees#index'
  get 'employees/new'
  get 'employees/:id', to: 'employees#show', as:'show_employees'
  get 'employees/:id/edit', to: 'employees#edit', as:'edit_employee'
  post 'employees', to: 'employees#create'
  delete 'employees/:id', to: 'employees#destroy', as:'delete_employee'
  patch 'employees/:id', to: 'employees#update', as:'employee'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'home#index'
end
