Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :reservations
  end
  root 'events#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
