require 'pp'

namespace :db do
  desc "Fill the petclinic database with sample data"
  task :populate => :environment do
    
    OWNER_COUNT = 1000
    VET_COUNT = 1500
    
    one_year_seconds = 365 * 24 * 3600
    ten_years_seconds = 10 * one_year_seconds
    
    pet_names_file = File.join(File.dirname(__FILE__), 'pet_names.txt')
    pets = File.new(pet_names_file, 'r').readlines.collect { |n| n.chomp }
    
    pet_types_file = File.join(File.dirname(__FILE__), 'pet_types.txt')
    pet_type_names = File.new(pet_types_file, 'r').readlines.collect { |n| n.chomp }
    
    specialties_file = File.join(File.dirname(__FILE__), 'specialties.txt')
    specialty_names = File.new(specialties_file, 'r').readlines.collect { |n| n.chomp }

    pet_type_names.each do |pet_type|
      PetType.create!(:name => pet_type)
    end
    pet_types = PetType.find(:all)

    OWNER_COUNT.times {
      o = Owner.create!(:first_name => Faker::Name.first_name, 
                    :last_name => Faker::Name.last_name,
                    :address => Faker::Address.street_address,
                    :city => Faker::Address.city,
                    :telephone => Faker::PhoneNumber.phone_number)
      (rand(3)+1).times {
        p = Pet.create!(:name => pets[rand(pets.size)], 
                       :owner_id => o.id,
                       :birth_date => Time.at(Time.now.to_i - rand(ten_years_seconds)),
                       :pet_type_id => pet_types[rand(pet_types.size)].id)
                             (rand(4)).times {
        v = Visit.create!(:visit_date => Time.at(Time.now.to_i - rand(one_year_seconds)),
                          :description => Faker::Lorem.sentence(2),
                          :pet_id => p.id )
        }
      }
    }
    all_owners = Owner.find(:all)
    all_pets = Pet.find(:all)
    
    specialty_names.each do |s_name|
      Specialty.create!(:name => s_name)
    end
    specialties = Specialty.find(:all)
    
    VET_COUNT.times {
      v = Vet.create!(:first_name => Faker::Name.first_name,
                      :last_name => Faker::Name.last_name)
      (rand(5)+1).times {
        specialties = Specialty.find(:all)
        v.specialties << specialties.delete(specialties[rand(specialties.size)])
      }
      v.save!
    }

  end
  
end
