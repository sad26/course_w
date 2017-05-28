class Automobile < ActiveRecord::Base
  has_many :drivers, dependent: :destroy
  has_many :orders

  validates :automobile_model, length: {minimum: 5, maximum: 30}
  validates :automobile_type, inclusion: {in: ["Бизнес", "Эконом"]}
  validates :state_number, format: {with: /(а|в|е|к|м|н|о|р|с|т|у|х){2}\d{3}\d{2,3}/}, uniqueness: true
  validates :color, presence: true, length: {maximum: 20}
  validates :release, numericality: {greater_than_or_equal_to: 1900, less_than_or_equal_to: Date.today.year}
end
