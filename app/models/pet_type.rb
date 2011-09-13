class PetType < ActiveRecord::Base
  
  has_one :pet
end
