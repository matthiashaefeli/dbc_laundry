class Order < ApplicationRecord
	belongs_to :client
	belongs_to :business
	has_many :items
end
