class Comment < ApplicationRecord
  belongs_to :event
  validates :content,  presence: true, length: { maximum: 280 }
end
