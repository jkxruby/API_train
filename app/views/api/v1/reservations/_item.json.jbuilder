json.booking_code reservation.booking_code
json.train_number reservation.train.number
json.train do
  json.partial! 'api/v1/trains/item', train: reservation.train
end
json.seat_number reservation.seat_number
json.customer_name reservation.customer_name
json.customer_phone reservation.customer_phone
