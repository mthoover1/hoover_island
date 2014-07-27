class CreateReservationStatuses < ActiveRecord::Migration
  def change
    create_table :reservation_statuses do |t|
      t.string :status
    end
  end
end
