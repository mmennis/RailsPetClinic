class CreatePetTypes < ActiveRecord::Migration
  def self.up
    create_table :pet_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :pet_types
  end
end
