module ShippersHelper

	def box_array (boxes)
		b_array = ["Select deliver address"]
		boxes.each do |box|
			b_array << [box.address]
		end
		b_array
	end

  def selected_shipper(order)
    if order.shipper_id
      shipper = Shipper.find(order.shipper_id).name
    else
      shipper = "Select Shipper"
    end
  end
  
end