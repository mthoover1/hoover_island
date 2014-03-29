class Person
  validates_presence_of :first_name, :last_name, :seniority
  validates_uniqueness_of :first_name, :last_name, :initials
end
