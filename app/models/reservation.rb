class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  # validates :name,  presence: true, length: { maximum: 30 }
  # validates :content,  presence: true, length: { maximum: 144 }
end
