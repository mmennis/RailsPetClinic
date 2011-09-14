class Owner < ActiveRecord::Base
  
  has_many :pets
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :address, :presence => true
  validates :city, :presence => true
  validates :telephone, :presence => true
  
  def self.find_by_last_name(last_name)
    if last_name
      Owner.where("last_name like :last_name ", {:last_name => "%#{last_name}%" })
    else
      Owner.find(:all)
    end
  end
end
