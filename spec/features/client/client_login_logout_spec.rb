require 'rails_helper'

feature "Client can log in " do
  scenario "Valid client can log in" do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    client = Client.create(name: "Client", phone: "1231234123", business: business, email: "client@client.com", password: "password")
    visit new_client_session_path
    within(".new_client") do
      fill_in("Enter Email", with: 'client@client.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')

    expect(page).to have_current_path root_path
  end

  scenario "Invalid client cannot log in " do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    Client.create(name: "Client", phone: "1231234123", business: business, email: "client@client.com", password: "password")
    visit new_client_session_path

    within(".new_client") do
      fill_in("Password", with: 'password')
    end
    click_on('Log in')

    expect(page).to have_current_path new_client_session_path

    within(".alert") do
      expect(page).to have_content "Invalid Email or password."
    end
  end

  scenario "Client can log out" do
     business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    Client.create(name: "Client", phone: "1231234123", business: business, email: "client@client.com", password: "password")
    visit new_client_session_path

    within(".new_client") do
      fill_in("Enter Email", with: 'client@client.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')

    within(".admin-menu") do
      click_on("Logout")
    end

    expect(page).to have_current_path root_path
    expect(page).to have_content "Signed out successfully"
  end

  scenario "Client edits itself" do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    client = Client.create(name: "Client", phone: "1231234123", business: business, email: "client@client.com", password: "password")
    visit new_client_session_path
    within(".new_client") do
      fill_in("Enter Email", with: 'client@client.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')

    expect(page).to have_current_path root_path

    within(".client-edit-profile") do
      click_on("Edit profile")
    end

    fill_in('client_name', :with => 'Johaness')
    fill_in('Current Password', :with => 'password')
    click_on('Update')

    within(".client-edit-profile") do
      click_on("Edit profile")
    end

    expect(page).to have_selector("input[value='Johaness']")
  end

end
