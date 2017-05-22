require 'rails_helper'



 feature 'Admin clicks ' do 
 	 scenario "Valid admin can log in" do
  	#ADMIN LOGS IN 
  	business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
  	admin = Admin.create(name: "Tim", business: business, email: "admin@admin.com", password: "password")
  	box = Box.create(name: 'Frost Bank', business_id: business.id, address: 'Barbara Jordan Blvd')
    shipper = Shipper.create(name: "John", email: "shipper@shipper.com", password: "password",  phone: "5122223344", business_id: business.id)
  	client = Client.create(name: "Mr Happy face", password: "password", email: "happy@client.com", phone: "4993333333", business_id: business.id, bag_id: 1234)
  	order = Order.create(id: 1, box_in: 1, box_out:1, client: client, business: business, status: 'Incomming', total: 100, paid: true)
  	
  	visit new_admin_session_path
  	within(".container") do
  		fill_in("Email", with: 'admin@admin.com')
  		fill_in("Password", with: 'password')
  	end
  	click_on('Log in')
  	expect(page).to have_current_path root_path
  	
    click_on('Business')
  	click_on('John')
     save_and_open_page
     within(".edit_shipper") do
        fill_in('shipper[name]', :with => 'Pepe Lepeu')
        fill_in('shipper[password]', :with => 'password')
      end
      save_and_open_page
      click_on('Update')
      click_on('Shippers')
   expect(page).to have_content 'Pepe Lepeu'
    expect(page).to have_current_path all_shippers_path
  end
end