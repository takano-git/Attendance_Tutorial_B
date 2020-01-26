Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    collection { post :import }
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      # users/1/attendances/edit_one_month のurlになる
      get 'attendances/edit_one_month'
      # users/1/attendances/update_one_month のurlになる
      patch 'attendances/update_one_month' 
    end
    resources :attendances, only: :update
  end
end
