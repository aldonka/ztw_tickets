class Event < ApplicationRecord
  has_many :tickets
  validates :artist, presence: {message: "Proszę podać nazwę artysty/wydarzenia"}
  validates :tickets_no, :presence => true
  validates :tickets_no, numericality: {only_integer: true, greater_than: 0, message: "Nie może być mniej niż 1 bilet w wydarzeniu"}
  validates :price_high, :presence => true
  validates :price_high, numericality: {only_integer: true, greater_than_or_equal_to: :price_low, message: "Cena nie może być mniejsza od najniższej ceny"}
  validates :price_low, :presence => true
  validates :price_low, numericality: {only_integer: true, greater_than_or_equal_to: 0, message: "Cena nie może być mniejsza od 0 zł"}
  validates :event_date, :presence => true
#  validate :valid_date?
  validate :event_date_cannot_be_in_the_past

  def event_date_cannot_be_in_the_past
    if event_date.present? && event_date < Date.today
      errors.add(:event_date, 'Wydarzenie nie może być w przeszłości.')
    end
  end

  def valid_date?
    if event_date.present?
      if (Date.strptime(event_date, '%d-%m-%Y') rescue nil).nil?
        errors.add(:event_date, 'Zły format daty, powinien być: dd-mm-yyyy')
      end
    end
  end

  def artist_and_date
    "#{artist}, #{event_date}"
  end
end
