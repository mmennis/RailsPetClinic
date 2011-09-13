class AddPetTypeToPets < ActiveRecord::Migration
  def self.up
    add_column :pets, :pet_type_id, :integer
  end

  def self.down
    remove_column :pets, :pet_type_id
  end
end
