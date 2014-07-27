class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :year
      t.string :notes
      t.integer :fishing_spot_id
      t.integer :animal_siting_id
    end
  end
end
