class Pet < ActiveRecord::Base
  
  belongs_to :owner
  belongs_to :pet_type
  has_many :visits
  
end
