class CreatePets < ActiveRecord::Migration
  def self.up
    create_table :pets do |t|
      t.string :name
      t.datetime :birth_date
      t.integer :owner_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pets
  end
end
