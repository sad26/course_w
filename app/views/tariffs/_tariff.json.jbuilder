json.extract! tariff, :id, :name, :time_of_day, :range, :price_per_kilometer, :created_at, :updated_at
json.url tariff_url(tariff, format: :json)
