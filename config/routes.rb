# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tests do
        resources :questions, controller: 'tests/questions'
      end
    end
  end
end
