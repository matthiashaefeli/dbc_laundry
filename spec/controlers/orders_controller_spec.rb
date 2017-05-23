require "rails_helper"

RSpec.describe OrdersController, :type => :controller do
  describe "GET new" do
    it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "responds to" do 
    let(:business){Business.create(name: "Wishi washy", email: "wishy@washy.com", hash_password: "password")}
    let(:order){Order.create(client_id: client.id, business_id: business.id, box_in: 1, status: "In Box", paid: false)}
    it "find order by id" do 
      expect(response.status).to eq(200)
    end
  end
end