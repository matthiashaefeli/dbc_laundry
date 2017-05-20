module OrdersHelper

  def status_bar(order)
    status_percentage = {
      "In Box" => "5",
      "Incomming" => "10",
      "Processing" => "50",
      "Shipping" => "90",
      "Delivered" => "100"
    }
    status = status_percentage[order.status]
  end

  def shipper_array (shippers)
    s_array = ["Select Shipper"]
    shippers.each do |shipper|
      s_array << [shipper.name]
    end
    s_array
  end
end
