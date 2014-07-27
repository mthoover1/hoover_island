class Account < ActiveRecord::Base
  belongs_to :person

  validates_presence_of :person_id, :email, :password_digest
  validates_uniqueness_of :person_id, :email

  has_secure_password
end
