require 'rails_helper'

describe Admin, type: :model do
  let(:admin){Admin.new(name: "Admin", email: "admin@admin.com", encrypted_password: "password")}
  let(:business){Business.new(name: "Wishi washy", email: "wishy@washy.com", hash_password: "password")}

  it "has a name" do
    expect(admin.name).to eq "Admin"
  end

  it "has an email" do
    expect(admin.email).to eq "admin@admin.com"
  end

  it "has a password" do
    expect(admin.encrypted_password).to eq "password"
  end

  it "has a business" do
    admin.business = business
    expect(admin.business).to eq business
  end

end
