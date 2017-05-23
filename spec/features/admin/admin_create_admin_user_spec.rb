require 'rails_helper'

feature "admin can log in and create a new admin user" do
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
    expect(page).to have_content 'Create Admin user'
    fill_in("admin_name", with: 'Admin New')
    fill_in("admin_email", with: 'admin2@admin.com')
    fill_in("admin_password", with: 'password')
    fill_in("admin_password_confirmation", with: 'password')
    click_on('Create admin')
    Admin.last == "<Admin id: 74, name: 'Admin New', email: 'admin2@admin.com', created_at: '2017-05-22 17:18:01', updated_at: '2017-05-22 17:18:01', business_id: 263>"
  end
end
