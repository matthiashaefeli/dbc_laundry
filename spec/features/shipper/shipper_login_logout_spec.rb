require 'rails_helper'

feature "shipper can log in " do
  scenario "Valid shipper can log in" do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    shipper = Shipper.create(name: "shipper", phone: "1231112354", business: business, email: "shipper@shipper.com", password: "password")
    visit new_shipper_session_path
    within(".container") do
      fill_in("Email", with: 'shipper@shipper.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')

    expect(page).to have_current_path root_path
  end

  scenario "Invalid shipper cannot log in " do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    shipper = Shipper.create(name: "shipper", phone: "1231112354", business: business, email: "shipper@shipper.com", password: "password")
    visit new_shipper_session_path

    within(".container") do
      fill_in("Password", with: 'password')
    end
    click_on('Log in')

    expect(page).to have_current_path new_shipper_session_path

    within(".alert") do
      expect(page).to have_content "Invalid Email or password."
    end
  end

  scenario "shipper can log out" do
     business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    shipper = Shipper.create(name: "shipper", phone: "1231112354", business: business, email: "shipper@shipper.com", password: "password")
    visit new_shipper_session_path

    within(".container") do
      fill_in("Email", with: 'shipper@shipper.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')

    within(".admin-header") do
      click_on("Logout")
    end

    expect(page).to have_current_path root_path
    expect(page).to have_content "Signed out successfully"
  end
end
