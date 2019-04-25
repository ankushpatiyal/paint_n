Rails.application.routes.draw do

  root to: 'welcome#index'
  post 'profile/upload_profile_photo'
  post 'profile/hide_painting/:id', to: 'profile#hide_painting', as: :hide_painting
  resources :profile

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
