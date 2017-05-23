require 'rails_helper'

feature "admin can log in and update profile" do
  scenario "admin updates profile" do
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
  #ADMIN CLICKS EDIT PROFILE
    click_on('Edit profile')
    expect(page).to have_content 'Edit Admin'
    fill_in("Name", with: 'Admin Edit')
    fill_in("Email", with: 'admin1@admin.com')
    click_on('Update')
    click_on('Edit profile')

    
    find_field('Name').value == "Admin Edit"
    find_field('Email').value == "admin1@admin.com"

    save_and_open_page
  end
end
