class Order < ApplicationRecord

	belongs_to :client
	belongs_to :business
	has_many   :items

	validates  :client_id, presence: true
	validates  :business_id, presence: true
	validates  :box_in, presnece: true
	
end
