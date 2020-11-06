class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :comments, dependent: :destroy
  has_many :select_dates, dependent: :destroy
  accepts_nested_attributes_for :select_dates, allow_destroy: true
  mount_uploader :flyer, ImageUploader
  mount_uploader :time_table, ImageUploader

  enum status: { 公演前: 0, 公演中: 1, 公演後: 2 }

  validates :event_name,  presence: true, length: { maximum: 30 }
  validates :company_name,  presence: true, length: { maximum: 30 }
  validates :place,  presence: true, length: { maximum: 30 }
  validates :period,  presence: true
  validates :status,  presence: true
  validate  :date_not_before_today
  validate  :period_not_before_period_end

  def date_not_before_today
    errors.add(:period, "は今日以降のものを選択してください") if period.nil? || period < Date.today
  end
  def period_not_before_period_end
    errors.add(:period_end, "は初日以降のものを選択してください") if period_end.nil? || period_end <= period
  end

end