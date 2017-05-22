require 'rails_helper'

feature "admin can log in and view shippers" do
  scenario "Valid admin can log in" do
  #ADMIN LOGS IN 
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    admin = Admin.create(name: "Admin", business: business, email: "admin@admin.com", password: "password")
    shipper = Shipper.create(name: "John", email: "shipper@shipper.com", password: "password",  phone: "5122223344", business_id: business.id)
    
    visit new_admin_session_path
    within(".container") do
      fill_in("Email", with: 'admin@admin.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')
    expect(page).to have_current_path root_path
  #ADMIN CLICKS Shippers
    visit all_shippers_path
    expect(page).to have_current_path all_shippers_path
    expect(page).to have_content 'John'
    

  end
end