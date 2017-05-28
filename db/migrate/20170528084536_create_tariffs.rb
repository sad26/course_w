class CreateTariffs < ActiveRecord::Migration
  def change
    create_table :tariffs do |t|
      t.string :name, null: false, limit: 20
      t.string :time_of_day, null: false
      t.string :range, null: false
      t.float :price_per_kilometer, null: false

      t.index [:name], unique: true

      t.timestamps null: false
    end
  end

  def up
    execute("ALTER TABLE tariffs ADD CONSTRAINT time_of_day_check CHECK(time_of_day IN('День', 'Ночь'))")
    execute("ALTER TABLE tariffs ADD CONSTRAINT range_check CHECK(range IN('в пределах МКАД', 'за МКАД', 'Подмосковье'))")
    execute("ALTER TABLE tariffs ADD CONSTRAINT price_per_kilometer_check CHECK(price_per_kilometer >= 0))")
  end

  def down
    execute("ALTER TABLE tariffs DROP CONSTRAINT time_of_day_check")
    execute("ALTER TABLE tariffs DROP CONSTRAINT range_check")
    execute("ALTER TABLE tariffs DROP CONSTRAINT price_per_kilometer_check")
  end
end
