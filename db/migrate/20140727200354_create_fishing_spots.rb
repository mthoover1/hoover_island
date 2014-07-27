class CreateFishingSpots < ActiveRecord::Migration
  def change
    create_table :fishing_spots do |t|
      t.string :size
      t.string :type_of_fish
      t.decimal :lat, precision: 10, scale: 7
      t.decimal :long, precision: 10, scale: 7
      t.string :type_of_day
      t.integer :trip_id
      t.string :lure
      t.string :notes

      t.timestamps
    end
  end
end
