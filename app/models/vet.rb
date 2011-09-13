class Vet < ActiveRecord::Base
  
  has_many :vet_specialties
  has_many :specialties, :through => :vet_specialties
  
end
