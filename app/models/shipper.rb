class Shipper < ApplicationRecord
	belongs_to :business
	has_many :boxes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,  :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
