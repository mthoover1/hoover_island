class PersonTrip < ActiveRecord::Base
  belongs_to :person
  belongs_to :trip
end
