class Trip < ActiveRecord::Base
  has_many :person_trips
  has_many :people, through: :person_trips
  has_one :reservation_request

end
