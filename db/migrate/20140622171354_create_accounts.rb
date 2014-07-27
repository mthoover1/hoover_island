class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :person_id
      t.string  :email
      t.string  :password_digest
    end
  end
end
