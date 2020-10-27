Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :events do
    resources :reservations
    resources :comments
  end
  root 'tops#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
