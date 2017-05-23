module OrdersHelper

  def status_bar(order)
    status_percentage = {
      "In Box" => "5",
      "Incoming" => "22",
      "Processing" => "50",
      "Shipping" => "75",
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


  def boxes_count(count)
    array_nums = [1..count].to_a
    array_nums
  end
end
