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
      # get :show, :params => {:id => order.id}
      expect(response.status).to eq(200)
    end
  end

    it "should have a current_user" do
    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
    expect(subject.current_client).to_not eq(nil)
  end

  describe "create" do 
    let(:client){Client.create(name: "Client", phone: "123-111-2354",email: "client@client.com", password: "password", business_id: business.id, bag_id: 1)}
    let(:current_client) {client}
    it "create a new order" do 
      post :create, :params => { :orders => { :pick_up_address => "hello world"} }
      expect(response).to eq :order
    end
  end
end