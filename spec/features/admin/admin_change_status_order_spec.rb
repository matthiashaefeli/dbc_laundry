require 'rails_helper'



 feature 'Admin clicks on a drop down menu and changes order status' do
 	 scenario "valid admin can change the status of an order" do
  	business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
  	admin = Admin.create(name: "Admin", business: business, email: "admin@admin.com", password: "password")
  	box = Box.create(name: 'Frost Bank', business_id: business.id, address: 'Barbara Jordan Blvd')

  	client = Client.create(name: "Mr Happy face", password: "password", email: "happy@client.com", phone: "4993333333", business_id: business.id, bag_id: 1234)
  	order = Order.create(id: 1, box_in: 1, box_out:1, client: client, business: business, status: 'Incomming', total: 100, paid: true)

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
