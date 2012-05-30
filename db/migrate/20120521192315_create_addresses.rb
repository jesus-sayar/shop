class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string   "firstname"
      t.string   "lastname"
      t.string   "address"
      t.string   "city"
      t.string   "state"
      t.string   "zipcode"
      t.string   "phone"
      
      t.timestamps
    end
  end
end
