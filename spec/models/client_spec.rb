require 'rails_helper'

describe Client, type: :model do
  let(:business){Business.new(name: "Wishi washy", email: "wishy@washy.com", hash_password: "password")}
  let(:client){Client.new(name: "Client", phone: "123-111-2354",email: "client@client.com", encrypted_password: "password", business_id: business.id)}

  it "has a name" do
    expect(client.name).to eq "Client"
  end

  it "has a phone" do
    expect(client.phone).to eq "123-111-2354"
  end

  it "has an email" do
    expect(client.email).to eq "client@client.com"
  end

  it "has a password" do
    expect(client.encrypted_password).to eq "password"
  end

  it "has a business" do
    client.business = business
    expect(client.business).to eq business
  end

end
