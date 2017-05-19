class Box < ApplicationRecord
  validates :business_id, :address, presence: true
  
  belong_to :business

end
