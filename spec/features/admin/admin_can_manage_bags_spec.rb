require 'rails_helper'
feature 'Admin can manage bags' do
   scenario "Admin can assign a valid bag id to a client" do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    admin = Admin.create(name: "Tim", business: business, email: "admin@admin.com", password: "password")
    box = Box.create(name: 'Frost Bank', business_id: business.id, address: 'Barbara Jordan Blvd')
    client = Client.create(name: "Mr Happy face", password: "password", email: "happy@client.com", phone: "4993333333", business_id: business.id)
    visit new_admin_session_path
    within(".container") do
      fill_in("Email", with: 'admin@admin.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')
    visit business_path(business)

    within(".edit-bag") do
      fill_in("bag_id", :with => "12345")
    end
    click_on("set")

    expect(page).to have_content "12345"
  end

  scenario "Admin cannot assign a bag that has already been assigned" do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    admin = Admin.create(name: "Tim", business: business, email: "admin@admin.com", password: "password")
    box = Box.create(name: 'Frost Bank', business_id: business.id, address: 'Barbara Jordan Blvd')
    client1 = Client.create(name: "Mr Cheery Face", password: "password", email: "chery@client.com", phone: "9333333334", business_id: business.id, bag_id: "12345")
    client = Client.create(name: "Mr Happy face", password: "password", email: "happy@client.com", phone: "4993333333", business_id: business.id)
    visit new_admin_session_path
    within(".container") do
      fill_in("Email", with: 'admin@admin.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')
    visit business_path(business)

    within(".edit-bag") do
      fill_in("bag_id", :with => "12345")
    end
    click_on("set")

    expect(page).to have_content "Bag is already in use"
  end

  scenario "Admin cannot assign a bag that has already been assigned" do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    admin = Admin.create(name: "Tim", business: business, email: "admin@admin.com", password: "password")
    box = Box.create(name: 'Frost Bank', business_id: business.id, address: 'Barbara Jordan Blvd')
    client1 = Client.create(name: "Mr Cheery Face", password: "password", email: "chery@client.com", phone: "9333333334", business_id: business.id, bag_id: "12345")
    client = Client.create(name: "Mr Happy face", password: "password", email: "happy@client.com", phone: "4993333333", business_id: business.id)
    visit new_admin_session_path
    within(".container") do
      fill_in("Email", with: 'admin@admin.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')
    visit business_path(business)

    click_on("12345")
    expect(page).to have_current_path edit_bag_path(client1)

    within(".edit_client") do
      fill_in("client[bag_id]", with: "55555")
    end
    click_on("Update Client")

    expect(page).to have_content "55555"
  end
end
