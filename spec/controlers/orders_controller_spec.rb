require "rails_helper"

RSpec.describe OrdersController, :type => :controller do
  describe "GET new" do
    it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    let(:business){Business.create(name: "Wishi washy", email: "wishy@washy.com", hash_password: "password")}
    let(:client){Client.create(name: "Client", phone: "1231234123", business: business, email: "client@client.com", password: "password")}
    let(:order){Order.create(client_id: client.id, business_id: business.id, box_in: 1, status: "In Box", paid: false)}
    it "has a 200 status code" do
      post :show, params: { id: order.id}
      expect(response.status).to eq(204)
    end
  end

  describe "responds to" do 
    let(:business){Business.create(name: "Wishi washy", email: "wishy@washy.com", hash_password: "password")}
    let(:order){Order.create(client_id: client.id, business_id: business.id, box_in: 1, status: "In Box", paid: false)}
    it "find order by id" do 
      expect(response.status).to eq(200)
    end
  end

  describe "order controller" do 
    it "has a 200 status code with In box" do
      post :update_status, xhr: true, params: { order: { order_status: 'In Box' }}
      expect(response.status).to eq(200)
    end

    it "has a 200 status code with Incoming" do
      post :update_status, xhr: true, params: { order: { order_status: 'Incoming' }}
      expect(response.status).to eq(200)
    end

   it "has a 200 status code with Processing" do
      post :update_status, xhr: true, params: { order: { order_status: 'Processing' }}
      expect(response.status).to eq(200)
    end

    it "has a 200 status code with Shipping" do
      post :update_status, xhr: true, params: { order: { order_status: 'Shipping' }}
      expect(response.status).to eq(200)
    end

    it "has a 200 status code with Delivered" do
      post :update_status, xhr: true, params: { order: { order_status: 'Delivered' }}
      expect(response.status).to eq(200)
    end

    it "has a 200 status code with Delivered" do
      post :update_status, xhr: true, params: { order: { order_status: '' }}
      expect(response.status).to eq(200)
    end

      it "has a 200 status code with Delivered" do
      post :update_status, params: { order: { order_status: '' }}
      expect(response.status).to eq(204)
    end
  end
end