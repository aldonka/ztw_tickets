class Ticket < ApplicationRecord
  belongs_to :event
  validates :name, :presence => true
  validates :email_address, :presence => true
  validates :price, :presence => true
end
