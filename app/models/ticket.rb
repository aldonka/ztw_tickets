class Ticket < ApplicationRecord
  belongs_to :event
  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :email_address, :presence => true
  validate :less_than_5_tickets
  validates :price, :presence => true
  validate :price_between_min_max

  def less_than_5_tickets
    less_than_5 = Ticket.where('event_id = ? and email_address = ?', event_id, email_address).count
    if(less_than_5 >= 5)
      errors.add(:email_address, 'Można zamówić maksymalnie 5 biletów na dane wydarzenie.')
    end
  end

  def price_between_min_max
    event = Event.find(event_id)
    if(price < event.price_low or price > event.price_high)
      errors.add(:price, 'Cena musi zawierać się w przedziale %d - %d' % [event.price_low, event.price_high])
    end
  end
end
