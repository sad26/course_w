class Driver < ActiveRecord::Base
  belongs_to :automobile

  validates :last_name, length: {minimum: 2, maximum: 20}
  validates :first_name, length: {minimum: 2, maximum: 20}
  validates :patronymic, length: {maximum: 20}
  validates :date_of_birth, presence: true
  validate :date_of_birth_cannot_be_in_the_future
  validates :itn, format: {with: /\d{12}/, message: "должен состоять из 12 цифр"}, uniqueness: true
  validates :passport, format: {with: /\d{10}/, message: "должны состоять из 10 цифр"}, uniqueness: true

  accepts_nested_attributes_for :automobile, allow_destroy: true

  # валидатор даты рождения:
  def date_of_birth_cannot_be_in_the_future
    if !date_of_birth.nil?
      if date_of_birth > Date.today
        errors.add(:date_of_birth, "не может быть больше текущей даты")
      end
    end
  end
end
