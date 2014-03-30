class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :year
    end
  end
end
