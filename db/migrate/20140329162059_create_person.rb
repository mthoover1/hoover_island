class CreatePerson < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :initials
      t.integer :seniority, default: 10
      t.string  :email
    end
  end
end
