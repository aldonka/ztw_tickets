class Ticket < ApplicationRecord
  belongs_to :event
  validates :name, :presence => true
  # validates :name, :uniqueness => true
  validates :email_address, :presence => true
  validate :less_than_5_tickets
  validate :seat_is_taken
  validates :price, :presence => true
  validate :price_between_min_max

  def less_than_5_tickets
    tickets = Ticket.where('event_id = ? and email_address = ?', event_id, email_address)
    if tickets.size >= 5 and not(tickets.pluck(:id).include? id)
      errors.add(:email_address, 'Można zamówić maksymalnie 5 biletów na dane wydarzenie.')
    end
  end

  def seat_is_taken
    ticket = Ticket.where('event_id = ? and seat_id_seq = ?', event_id, seat_id_seq)
    if ticket and id != ticket.pluck(:id).first
      errors.add(:seat_id_seq, 'Wybrane miejsce jest już zajęte na to wydarzenie.')
    end
  end

  def price_between_min_max
    event = Event.find(event_id)
    if price.to_i < event.price_low.to_i or price.to_i > event.price_high.to_i
      errors.add(:price, 'Cena musi zawierać się w przedziale %d - %d' % [event.price_low, event.price_high])
    end
  end
end
