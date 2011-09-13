class CreateVetSpecialties < ActiveRecord::Migration
  def self.up
    create_table :vet_specialties do |t|
      t.integer :vet_id
      t.integer :specialty_id

      t.timestamps
    end
  end

  def self.down
    drop_table :vet_specialties
  end
end
