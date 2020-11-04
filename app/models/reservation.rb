class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :select_dates
  validates :date,  presence: true
  validates :remarks, length: { maximum: 36 }
  validate  :date_not_before_today
  validates :number_of_ticket, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 20}

  def date_not_before_today
    errors.add(:date, "は今日以降のものを選択してください") if date.nil? || date <= Date.today
  end
  enum status: { 一般席: 0, 招待席: 1 }
end
