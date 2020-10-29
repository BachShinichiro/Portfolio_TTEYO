class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :comments, dependent: :destroy
  mount_uploader :flyer, ImageUploader

  enum status: { 公演前: 0, 公演中: 1, 公演後: 2 }

  validates :event_name,  presence: true, length: { maximum: 30 }
end