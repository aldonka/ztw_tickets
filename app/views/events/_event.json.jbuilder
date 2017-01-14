json.extract! ticket, :id, :artist, :description, :event_date, :price_low, :price_high, :created_at, :updated_at
json.url event_url(event, format: :json)