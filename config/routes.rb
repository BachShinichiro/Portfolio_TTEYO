Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :reservations
    resources :comments
  end
  root 'tops#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  validates :password, presence: true, length: { minimum: 4 }
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
