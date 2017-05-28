class Business < ApplicationRecord
	has_many :admins
	has_many :orders
	has_many :clients
	has_many :shippers
	has_many :boxes


  def business_bags
    bags = []
    self.clients.each do |client|
      if client.bag_id != nil
      bags << client.bag_id
    end
    end
    bags
  end
end
