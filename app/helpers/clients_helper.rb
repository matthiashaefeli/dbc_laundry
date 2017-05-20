module ClientsHelper

  def unasigned_bags
      @clients = current_admin.business.clients
      unasigned = @clients.where.not("bag_id IS NOT NULL").count
  end
end
