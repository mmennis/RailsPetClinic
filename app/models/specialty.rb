class Specialty < ActiveRecord::Base
  
  has_many :vet_specialties
  has_many :vets, :through => :vet_specialties
  
end
