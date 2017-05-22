require 'rails_helper'

feature "admin can log in and create a new Shipper user" do
  scenario "Valid admin can log in" do
  #ADMIN LOGS IN 
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    admin = Admin.create(name: "Admin", business: business, email: "admin@admin.com", password: "password")
    visit new_admin_session_path
    within(".container") do
      fill_in("Email", with: 'admin@admin.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')
    expect(page).to have_current_path root_path
  #ADMIN CLICKS Setup
    click_on('Setup')
    expect(page).to have_content 'Create a new Shipper'
    fill_in("shipper_name", with: 'Shipper New')
    fill_in("shipper_phone", with: '5121234567')
    fill_in("shipper_email", with: 'shipper@shipper.com')
    fill_in("shipper_password", with: 'password')
    fill_in("shipper_password_confirmation", with: 'password')
    click_on('Create Shipper')
  end
end