Rails.application.routes.draw do
  resources :prompts, only: %i[index create show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'prompts#index'
end
