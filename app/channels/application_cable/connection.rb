module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_client
    def connect
      binding.pry
      self.current_client = current_client
    end
  end
end
