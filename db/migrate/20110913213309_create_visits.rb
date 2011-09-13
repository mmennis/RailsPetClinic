class CreateVisits < ActiveRecord::Migration
  def self.up
    create_table :visits do |t|
      t.datetime :visit_date
      t.string :description
      t.integer :pet_id

      t.timestamps
    end
  end

  def self.down
    drop_table :visits
  end
end
