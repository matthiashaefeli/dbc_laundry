class Business < ApplicationRecord
	has_many :admins
	has_many :orders
	has_many :clients
	has_many :shippers
	# has_many :boxes
end
