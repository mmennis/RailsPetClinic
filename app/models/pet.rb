class Pet < ActiveRecord::Base
  
  belongs_to :owner
  has_one :pet_type
  
end
