json.array!(@bookings) do |booking|
  json.extract! booking, :id, :title, :code
  json.url booking_url(booking, format: :json)
end
