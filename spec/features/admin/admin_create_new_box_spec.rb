require 'rails_helper'

feature "admin can log in and create a new Box" do
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
    expect(page).to have_content 'Create a new Box'
    fill_in("box_name", with: 'Box New')
    fill_in("box_address", with: 'my address')
    click_on('Create Box')
    Box.last == "<Box id: 22, name: 'Box New', business_id: 335, address: 'my address', created_at: '2017-05-22 17:23:52', updated_at: '2017-05-22 17:23:52'>"
  end
end
