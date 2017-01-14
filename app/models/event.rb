class Event < ApplicationRecord
  has_many :tickets
  validates :artist, :presence => true
  validates :tickets_no, :presence => true
  validates :price_high, :presence => true
  validates :price_high, :presence => true
  validates :event_date, :presence => true
end
