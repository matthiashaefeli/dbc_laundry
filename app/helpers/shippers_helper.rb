module ShippersHelper

	def box_array (boxes)
		b_array = []
		boxes.each do |box|
			b_array << [box.address]
		end
		b_array
	end
end