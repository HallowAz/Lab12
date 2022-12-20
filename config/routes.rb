# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  root 'sessions#autorization'
  get 'lab/input'
  get 'lab/show'
end
