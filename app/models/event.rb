class Event < ApplicationRecord
  belongs_to :user
  has_many :reservation
  mount_uploader :flyer, ImageUploader
end
