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
end
