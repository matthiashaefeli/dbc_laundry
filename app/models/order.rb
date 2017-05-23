class Order < ApplicationRecord
  after_save :update_client_status

	belongs_to :client
	belongs_to :business

	validates  :client_id, presence: true
	validates  :business_id, presence: true
	validates  :box_in, presence: true

  def update_client_status
   ActionCable.server.broadcast "updates_#{self.client_id}",
    status: self.status,
    user: self.client_id

  end
  
end
