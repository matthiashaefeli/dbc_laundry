require 'rails_helper'

feature "Client can check its history" do
  scenario "Client navigates to history" do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    client = Client.create(name: "Client", phone: "1231234123", business: business, email: "client@client.com", password: "password")
    visit new_client_session_path
    within(".new_client") do
      fill_in("Enter Email", with: 'client@client.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')

    within(".admin-header") do
      click_on("History")
    end

    expect(page).to have_current_path history_path
    expect(page).to have_content "Order history for Client"
  end

   scenario "Client can send delivered orders to history" do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    client = Client.create(name: "Client", phone: "1231234123", business: business, email: "client@client.com", password: "password")
    order = Order.create(box_in: 1, box_out: 1, client: client, business: business, status: "Delivered", total: 15, paid: true)
    visit new_client_session_path
    within(".new_client") do
      fill_in("Enter Email", with: 'client@client.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')

    expect(page).to have_content "Status for order number"

    click_on("Add order to History")

    expect(page).to_not have_content "Status for order number"

    within(".admin-header") do
      click_on("History")
    end
    expect(page).to have_content "true"


  end
end


