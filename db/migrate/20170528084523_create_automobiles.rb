class CreateAutomobiles < ActiveRecord::Migration
  def change
    create_table :automobiles do |t|
      t.string :automobile_model, null: false, limit: 30
      t.string :automobile_type, null: false
      t.string :state_number, null: false
      t.string :color, null: false, limit: 20
      t.integer :release, null: false

      t.index [:state_number], unique: true

      t.timestamps null: false
    end
  end

  def up
    execute("ALTER TABLE automobiles ADD CONSTRAINT automobile_type_check CHECK(automobile_type IN('Бизнес', 'Эконом'))")
  end

  def down
    execute("ALTER TABLE automobiles DROP CONSTRAINT automobile_type_check")
  end
end
