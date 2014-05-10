json.array!(@bookings) do |booking|
  json.extract! booking, :id, :price, :from, :to, :date, :date_back
  json.url booking_url(booking, format: :json)
end