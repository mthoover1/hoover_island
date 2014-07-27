class CreateAnimalSitings < ActiveRecord::Migration
  def change
    create_table :animal_sitings do |t|
      t.string :name
      t.decimal :lat, precision: 10, scale: 7
      t.decimal :long, precision: 10, scale: 7
      t.integer :trip_id
      t.string :notes

      t.timestamps
    end
  end
end
