class Box < ApplicationRecord
  validates :business_id, :address, presence: true
  
  belongs_to :business

end
