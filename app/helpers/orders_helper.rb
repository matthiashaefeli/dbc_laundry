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
end
