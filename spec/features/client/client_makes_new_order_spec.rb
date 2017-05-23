require 'rails_helper'

feature "Client can make a new order" do
  scenario "Client navigates to new order page" do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    client = Client.create(name: "Client", phone: "1231234123", business: business, email: "client@client.com", password: "password", bag_id: 123)

    visit new_client_session_path
    within(".new_client") do
      fill_in("Enter Email", with: 'client@client.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')

    within(".admin-header") do
      click_on("New Order")
    end

    expect(page).to have_current_path new_order_path
    expect(page).to have_content "SET LOCATION OR SCAN QR CODE"
  end

  scenario "Client creates a new order and pays it" do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")

    client = Client.create(name: "Client", phone: "1231234123", business: business, email: "client@client.com", password: "password", bag_id: 123)

    box = Box.create(name: 'University', business: business, address: 'Guadalupe St')
    visit new_client_session_path
    within(".new_client") do
      fill_in("Enter Email", with: 'client@client.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')

    within(".admin-header") do
      click_on("New Order")
    end

    visit new_order_path

    within(".new-order-container") do
      select "Guadalupe St", :from => "orders[pick_up_address]"
    end
    click_on('create order')

    expect(page).to have_current_path new_charge_path
    expect(page).to have_content "Amount:"

    within(".admin-header") do
      click_on("Home")
    end
  end

  scenario "Client can create a new late charge" do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    client = Client.create(name: "Client", phone: "1231234123", business: business, email: "client@client.com", password: "password")
    box = Box.create(name: 'University', business: business, address: 'Guadalupe St')
    order = Order.create(box_in: 1, box_out: 1, client: client, business: business, status: "Delivered", total: 15, paid: false)

    visit new_client_session_path
    within(".new_client") do
      fill_in("Enter Email", with: 'client@client.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')

    expect(page).to have_content "Paid: false"

    click_on("pay now")

    save_and_open_page
    expect(page).to have_content "Amount: $15.00"
  end

end
