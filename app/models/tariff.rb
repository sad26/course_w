class Tariff < ActiveRecord::Base
  has_many :orders

  validates :name, length: {maximum: 20}, presence: true, uniqueness: true
  validates :time_of_day, inclusion: {in: ["День", "Ночь"]}
  validates :range, inclusion: {in: ["в пределах МКАД", "за МКАД", "Подмосковье"]}
  validates :price_per_kilometer, numericality: {greater_than_or_equal_to: 0}
end
