class Person < ActiveRecord::Base
  require 'digest'

  validates_presence_of :first_name, :last_name, :seniority
  validates_uniqueness_of :first_name, :last_name, :initials

  has_secure_password
end
