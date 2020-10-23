class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :comments, dependent: :destroy
  mount_uploader :flyer, ImageUploader
end
