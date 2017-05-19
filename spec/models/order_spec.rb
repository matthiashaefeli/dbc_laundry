require 'rails_helper'

describe Order, type: :model do
  let(:business){Business.new(name: "Wishi washy", email: "wishy@washy.com", hash_password: "password")}
  let(:client){Client.new(name: "Client", phone: "123-111-2354",email: "client@client.com", encrypted_password: "password", business_id: business.id)}
  let(:order_shipped){Order.new(box_in: 1,client_id: client.id, business_id: business.id, status: "Shipped", total: 30, paid: false)}

  it "has a status" do
    expect(order_shipped.status).to eq "Shipped"
  end

  it "belongs to a client" do
    expect(order_shipped.client).to eq client
  end

  it "belongs to a business" do
    expect(order_shipped.business).to eq business
  end

  describe "can be paid" do
    it "has a total price" do
      expect(order_shipped.total).to eq 30
    end

    it "can be not paid" do
      expect(order_shipped.paid).to eq false
    end

    it "can be paid" do
      order_shipped.paid = true
      expect(order_shipped.paid).to eq true
    end
  end



end
