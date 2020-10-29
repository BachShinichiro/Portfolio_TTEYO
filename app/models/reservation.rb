class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :number_of_ticket,  presence: true
  validates :date,  presence: true
  enum status: { 一般席: 0, 招待席: 1 }
end
