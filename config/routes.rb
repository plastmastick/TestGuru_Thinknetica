# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus,
                     path_names: {
                       sign_in: :login,
                       sign_out: :logout
                     },
                     controllers: {
                       registrations: 'users/registrations',
                       sessions: 'users/sessions'
                     }

  resources :feedbacks, only: %i[new create]

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :test_passage
    end
    resources :gists, only: :create
  end

  namespace :admin do
    resources :gists, only: :index
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
