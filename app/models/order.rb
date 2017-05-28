class Order < ApplicationRecord
  include OrdersHelper
  after_save :update_client_status

	belongs_to :client
	belongs_to :business

	validates  :client_id, presence: true
	validates  :business_id, presence: true
	validates  :box_in, presence: true

  def update_client_status
   # ActionCable.server.broadcast "updates_#{self.client_id}",
   ActionCable.server.broadcast "updates",
    client_id: self.client_id,
    order_id: self.id,
    status: status_bar(self)
  end
  
end
