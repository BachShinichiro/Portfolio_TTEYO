class Event < ApplicationRecord
  belongs_to :user
  mount_uploader :flyer, ImageUploader
end
