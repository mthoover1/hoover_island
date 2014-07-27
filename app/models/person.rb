class Person < ActiveRecord::Base
  has_many   :person_trips
  has_many   :trips, through: :person_trips
  has_one    :account
  belongs_to :spouse, foreign_key: :spouse_id, primary_key: :id, class_name: "Person"
  belongs_to :parent, foreign_key: :parent_id, primary_key: :id, class_name: "Person"
  has_many   :children, class_name: 'Person', foreign_key: :parent_id

  validates_presence_of :first_name, :last_name, :seniority
  validates_uniqueness_of :first_name, scope: [:last_name, :initials]
  validates :initials, length: {minimum: 2, maximum: 4}, allow_blank: true

  scope :hoovers, -> { where(hoover: true) }
  scope :guests, -> { where(hoover: false) }
  scope :spouses, -> { guests.where("spouse_id > ?", 0) }
  scope :friends, -> { guests.where("spouse_id IS NULL") }

  def full_name
    "#{first_name} #{last_name}"
  end

  def trip_count
    trips.count
  end
end
