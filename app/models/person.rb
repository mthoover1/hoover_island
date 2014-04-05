class Person < ActiveRecord::Base
  has_many :person_trips
  has_many :trips, through: :person_trips

  validates_presence_of :first_name, :last_name, :seniority
  validates_uniqueness_of :first_name, scope: [:last_name, :initials]
  validates :initials, length: {minimum: 2, maximum: 4}, allow_blank: true

  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end

  def trip_count
    trips.count
  end
end
