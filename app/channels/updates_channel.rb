class UpdatesChannel < ApplicationCable::Channel  
  # before_subscribe :current_client
  # def subscribed  
  #   stream_from "updates"
  # end
  # 
  def subscribed
    stream_from "updates_1"
  end
  # def follow
  #   stream_from "updates_1"
  # end
  def current_client
    binding.pry
  end

end  