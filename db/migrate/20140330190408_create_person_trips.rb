class CreatePersonTrips < ActiveRecord::Migration
  def change
    create_table :person_trips do |t|
      t.integer :trip_id
      t.integer :person_id
    end
  end
end
