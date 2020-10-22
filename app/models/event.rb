class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations
  mount_uploader :flyer, ImageUploader
end
