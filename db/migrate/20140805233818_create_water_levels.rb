class CreateWaterLevels < ActiveRecord::Migration
  def change
    create_table :water_levels do |t|
      t.decimal  :level, precision: 8, scale: 3
      t.datetime :created_at
    end
  end
end
