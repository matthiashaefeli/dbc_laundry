class Order < ApplicationRecord

	belongs_to :client
	belongs_to :business
	

	validates  :client_id, presence: true
	validates  :business_id, presence: true
	validates  :box_in, presence: true
  
end
