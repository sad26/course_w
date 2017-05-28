json.extract! order, :id, :time_of_travel, :departure_address, :arrival_address, :number_of_passengers, :length_of_route, :automobile_id, :tariff_id, :created_at, :updated_at
json.url order_url(order, format: :json)
