class CreateReservationRequests < ActiveRecord::Migration
  def change
    create_table :reservation_requests do |t|
      t.integer :person_id
      t.date    :start_date
      t.date    :end_date
      t.integer :visitor_count
      t.string  :note
      t.boolean :trip_approved, default: false
    end
  end
end
