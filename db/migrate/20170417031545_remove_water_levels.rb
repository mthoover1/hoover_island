class RemoveWaterLevels < ActiveRecord::Migration
  def change
    drop_table :water_levels
  end
end
