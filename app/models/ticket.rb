class Ticket < ApplicationRecord
  belongs_to :event
  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :email_address, :presence => true
  validate :less_than_5_ticekts
  validates :price, :presence => true

  def less_than_5_ticekts
    less_than_5 = Ticket.where('event_id = ? and email_address = ?', event_id, email_address).count
    if(less_than_5 >= 5)
      errors.add(:email_address, 'Można zamówić maksymalnie 5 biletów na dane wydarzenie.')
    end
  end
end
