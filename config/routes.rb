# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'
  get 'user/new'
  get :signup, to: 'users#new'
  resources :users, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :test_passage
    end
  end
end
