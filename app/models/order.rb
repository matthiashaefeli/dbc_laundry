class Order < ApplicationRecord

	belongs_to :client
	belongs_to :business
	belongs_to :box, foreign_key: :box_out
	

	validates  :client_id, presence: true
	validates  :business_id, presence: true
	validates  :box_in, presence: true
  
end
