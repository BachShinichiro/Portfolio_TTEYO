Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :select_dates
  resources :events do
    resources :reservations
    resources :comments
  end
  root 'tops#index'
  unless Rails.env.production?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
