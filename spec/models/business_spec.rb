require 'rails_helper'

describe Business, type: :model do
  let(:business){Business.new(name: "Wishi washy", email: "wishy@washy.com", hash_password: "password")}
  let(:admin){Admin.new(name: "Admin", email: "admin@admin.com", encrypted_password: "password", business_id: business.id)}
  let(:admin2){Admin.new(name: "Admin2", email: "admin2@admin.com", encrypted_password: "password", business_id: business.id)}
  let(:client){Client.new(name: "Client", phone: "123-111-2354",email: "client@client.com", encrypted_password: "password", business_id: business.id, bag_id: 1)}
  let(:client2){Client.new(name: "Client2", phone: "123-111-2354",email: "client2@client.com", encrypted_password: "password", business_id: business.id, bag_id: 2)}
  let(:order){Order.new(business_id: business.id, status: "In Box", client_id: client.id)}
  let(:order2){Order.new(business_id: business.id, status: "In Box", client_id: client2.id)}
  

  it "has a name" do
    expect(business.name).to eq "Wishi washy"
  end

  it "has an email" do
    expect(business.email).to eq "wishy@washy.com"
  end

  it "has a password" do
    expect(business.hash_password).to eq "password"
  end

  it "has many admins" do
    admins = business.admins
    expect(business.admins).to eq admins
  end

   it "has many orders" do
    orders = business.orders
    expect(business.orders).to eq orders
  end

  it "has many clients" do
    clients = business.clients
    expect(business.clients).to eq clients
  end
end