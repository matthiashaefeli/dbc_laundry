module ClientsHelper

  def unasigned_bags
      @clients = current_admin.business.clients
      unasigned = @clients.where.not("bag_id IS NOT NULL").count
  end

  def bag_in_use(bag_id)
    current_admin.business.business_bags.include?(bag_id.to_i)
  end
end
