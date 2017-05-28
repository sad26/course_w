class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :last_name, null: false, limit: 20
      t.string :first_name, null: false, limit: 20
      t.string :patronymic, limit: 20
      t.date :date_of_birth, null: false
      t.string :itn, null: false
      t.string :passport, null: false
      t.references :automobile, index: true, foreign_key: true

      t.index [:itn], unique: true
      t.index [:passport], unique: true

      t.timestamps null: false
    end
  end
end
