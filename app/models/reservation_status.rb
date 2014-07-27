class ReservationStatus < ActiveRecord::Base
  has_many :reservation_requests
end
