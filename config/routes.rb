# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tests do
    resources :questions, controller: 'tests/questions'
  end
end
