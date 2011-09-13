class VetSpecialty < ActiveRecord::Base
  
  belongs_to :vet
  belongs_to :specialty
  
end
