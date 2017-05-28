require 'rails_helper'

 feature 'Admin clicks on a drop down menu and changes order status' do
 	 scenario "Admin can change order status" do
  	#ADMIN LOGS IN

  	business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
  	admin = Admin.create(name: "Admin", business: business, email: "admin@admin.com", password: "password")
  	box = Box.create(name: 'Frost Bank', business_id: business.id, address: 'Barbara Jordan Blvd')

  	client = Client.create(name: "Mr Happy face", password: "password", email: "happy@client.com", phone: "4993333333", business_id: business.id, bag_id: 1234)
  	order = Order.create(id: 1, box_in: 1, box_out:1, client: client, business: business, status: 'Incoming', total: 100, paid: true)

  	visit new_admin_session_path
  	within(".container") do
  		fill_in("Email", with: 'admin@admin.com')
  		fill_in("Password", with: 'password')
  	end
  	click_on('Log in')
  	expect(page).to have_current_path root_path

    within(".remove-and-insert") do
  	 select('Processing', :from => 'order[order_status]')
    end
      click_on("update")
  end

  scenario "Admin can update a shipper" do
    #ADMIN LOGS IN

    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    admin = Admin.create(name: "Admin", business: business, email: "admin@admin.com", password: "password")
    box = Box.create(name: 'Frost Bank', business_id: business.id, address: 'Barbara Jordan Blvd')

    client = Client.create(name: "Mr Happy face", password: "password", email: "happy@client.com", phone: "4993333333", business_id: business.id, bag_id: 1234)
    shipper = Shipper.create(name: "John", email: "shipper@shipper.com", password: "password",  phone: "5122223344", business_id: business.id)
    order = Order.create(id: 1, box_in: 1, box_out:1, client: client, business: business, status: 'Shipping', total: 100, paid: true, shipper_id: shipper.id)

    visit new_admin_session_path
    within(".container") do
      fill_in("Email", with: 'admin@admin.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')
    expect(page).to have_current_path root_path

    within(".remove-and-insert") do
     select('Processing', :from => 'order[order_status]')
    end
      click_on("update")
  end
end

