class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.timestamp :time_of_travel, null: false
      t.string :departure_address, limit: 64, null: false
      t.string :arrival_address, limit: 64, null: false
      t.integer :number_of_passengers, null: false
      t.float :length_of_route, null: false
      t.references :automobile, index: true, foreign_key: true
      t.references :tariff, index: true, foreign_key: true

      t.timestamps null: false
    end
  end

  def up
    execute("ALTER TABLE orders ADD CONSTRAINT number_of_passengers_check CHECK(number_of_passengers > 0))")
    execute("ALTER TABLE orders ADD CONSTRAINT length_of_route_check CHECK(length_of_route > 0))")
  end

  def down
    execute("ALTER TABLE orders DROP CONSTRAINT number_of_passengers_check")
    execute("ALTER TABLE orders DROP CONSTRAINT length_of_route_check")
  end
end
