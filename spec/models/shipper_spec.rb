require 'rails_helper'

describe Shipper, type: :model do
  let(:business){Business.new(name: "Wishi washy", email: "wishy@washy.com", hash_password: "password")}
  let(:shipper){Shipper.new(phone: "123-111-2354",email: "shipper@shipper.com", encrypted_password: "password")}

  it "has a phone" do
    expect(shipper.phone).to eq "123-111-2354"
  end

  it "has an email" do
    expect(shipper.email).to eq "shipper@shipper.com"
  end

  it "has a password" do
    expect(shipper.encrypted_password).to eq "password"
  end

end
