class CreatePerson < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :initials
      t.integer :seniority, default: 10
      t.boolean :hoover, default: false
      t.integer :spouse_id
      t.integer :parent_id
    end
  end
end
