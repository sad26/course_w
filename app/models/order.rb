class Order < ActiveRecord::Base
  belongs_to :automobile
  belongs_to :tariff

  validate :time_of_travel_cannot_be_in_the_past
  validates :departure_address, length: {minimum: 10, maximum: 64}
  validates :arrival_address, length: {minimum: 10, maximum: 64}
  validates :number_of_passengers, numericality: {greater_than_or_equal_to: 1}
  validates :length_of_route, numericality: {greater_than_or_equal_to: 1}
  validates :time_of_travel, presence: true

  accepts_nested_attributes_for :tariff, allow_destroy: true
  accepts_nested_attributes_for :automobile, allow_destroy: true

  # валидатор времени подачи такси:
  def time_of_travel_cannot_be_in_the_past
    if !time_of_travel.nil?
      if time_of_travel < Time.now
        errors.add(:time_of_travel, "не может быть меньше текущего времени")
      end
    end
  end

  # поиск
  def self.search(params)
    result = Order.eager_load(:tariff, {:automobile => :drivers})

    # по атрибутам заказа:
    if params['time_of_travel_from'].present?
      result = result.where.not(time_of_travel: Time.at(0)...Time.parse(params['time_of_travel_from']))
    end
    if params['time_of_travel_to'].present?
      result = result.where(time_of_travel: Time.at(0)..Time.parse(params['time_of_travel_to']))
    end
    if params['departure_address'].present?
      result = result.where(departure_address: params['departure_address'])
    end
    if params['arrival_address'].present?
      result = result.where(arrival_address: params['arrival_address'])
    end
    if params['number_of_passengers'].present?
      result = result.where(number_of_passengers: params['number_of_passengers'])
    end
    if params['length_of_route_from'].present?
      result = result.where.not(length_of_route: 0...(params['length_of_route_from']).to_f)
    end
    if params['length_of_route_to'].present?
      result = result.where(length_of_route: 0..(params['length_of_route_to']).to_f)
    end

    # по атрибутам тарифа
    if params['tariff_name'].present?
      result = result.where(tariffs: {name: params['tariff_name']})
    end
    if params['time_of_day'].present?
      result = result.where(tariffs: {time_of_day: params['time_of_day']})
    end
    if params['range'].present?
      result = result.where(tariffs: {range: params['range']})
    end
    if params['price_per_kilometer_from'].present?
      result = result.where.not(tariffs: {price_per_kilometer: 0...(params['price_per_kilometer_from']).to_f})
    end
    if params['price_per_kilometer_to'].present?
      result = result.where(tariffs: {price_per_kilometer: 0..(params['price_per_kilometer_to']).to_f})
    end

    # по атрибутам авто:
    if params['automobile_model'].present?
      result = result.where(automobiles: {automobile_model: params['automobile_model']})
    end
    if params['automobile_type'].present?
      result = result.where(automobiles: {automobile_type: params['automobile_type']})
    end
    if params['state_number'].present?
      result = result.where(automobiles: {state_number: params['state_number']})
    end
    if params['color'].present?
      result = result.where(automobiles: {color: params['color']})
    end
    if params['release'].present?
      result = result.where(automobiles: {release: params['release']})
    end

    # по атрибутам водителя:
    if params['driver_last_name'].present?
      result = result.where(drivers: {last_name: params['driver_last_name']})
    end
    if params['driver_first_name'].present?
      result = result.where(drivers: {first_name: params['driver_first_name']})
    end
    if params['driver_patronymic'].present?
      result = result.where(drivers: {patronymic: params['driver_patronymic']})
    end
    if params['driver_date_of_birth'].present?
      result = result.where(drivers: {date_of_birth: params['driver_date_of_birth']})
    end
    if params['driver_itn'].present?
      result = result.where(drivers: {itn: params['driver_itn']})
    end
    if params['driver_passport'].present?
      result = result.where(drivers: {passport: params['driver_passport']})
    end

    result.all
  end
end
