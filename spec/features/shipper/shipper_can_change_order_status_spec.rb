 require 'rails_helper'
feature "Shipper can change the status of an order" do
  scenario "Shipper can see the orders it will deliver" do
   business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
   client = Client.create(name:  "Mrs Ready to wear", password: "password", email: "ready@client.com", phone: "49932209333", business: business, bag_id: 49049)
   shipper = Shipper.create(name: "shipper", phone: "1231112354", business: business, email: "shipper@shipper.com", password: "password")
   box = Box.create(name: 'Capitol', business: business, address: 'Congress Ave')
   order = Order.create(box_in: box.id, client: client, business: business, status: 'Shipping', total: 100, paid: true, shipper_id: shipper.id, box_out: box.id)
    visit new_shipper_session_path

      within(".container") do
        fill_in("Email", with: 'shipper@shipper.com')
        fill_in("Password", with: 'password')
      end
      click_on('Log in')

     expect(page).to have_content "Shipping"

     within("form") do
      select "Congress Ave", :from => "order[delivered_address]"
    end
     click_on "Save Order"

     expect(page).to_not have_content "Shipping"
  end
end
