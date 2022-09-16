# frozen_string_literal: true

Rails.application.routes.draw do

  # url employees
  #get 'employees', to: 'employees#index'
  #get 'employees/new'
  #get 'employees/:id', to: 'employees#show', as:'show_employees'
  #get 'employees/:id/edit', to: 'employees#edit', as:'edit_employee'
  #post 'employees', to: 'employees#create'
  #delete 'employees/:id', to: 'employees#destroy', as:'delete_employee'
  #patch 'employees/:id', to: 'employees#update', as:'employee'

  resources :companies
  resources :employees
  

  root 'home#index'
end
