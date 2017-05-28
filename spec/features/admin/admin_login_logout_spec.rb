require 'rails_helper'

feature "admin can log in " do
  scenario "Valid admin can log in" do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    admin = Admin.create(name: "Admin", business: business, email: "admin@admin.com", password: "password")
    visit new_admin_session_path
    within(".container") do
      fill_in("Email", with: 'admin@admin.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')
    expect(page).to have_current_path root_path
    
  end

  scenario "Invalid admin cannot log in " do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
     admin = Admin.create(name: "Admin", business: business, email: "admin@admin.com", password: "password")
    visit new_admin_session_path

    within(".container") do
      fill_in("Password", with: 'password')
    end
    click_on('Log in')

    expect(page).to have_current_path new_admin_session_path

    within(".alert") do
      expect(page).to have_content "Invalid Email or password."
    end
  end

  scenario "admin can log out" do
     business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
     admin = Admin.create(name: "Admin", business: business, email: "admin@admin.com", password: "password")
    visit new_admin_session_path

    within(".container") do
      fill_in("Email", with: 'admin@admin.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')

    within(".admin-header") do
      click_on("logout")
    end

    expect(page).to have_current_path root_path
    expect(page).to have_content "Signed out successfully"
  end
end
