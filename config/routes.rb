# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :subs
  resources :users
  #root 'sessions#autorization'
  root 'lab#input'
  get 'lab/show'
end
