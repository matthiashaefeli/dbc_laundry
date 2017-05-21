require 'rails_helper'

feature "Client register" do
  scenario "Valid client can register" do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    visit new_client_registration_path
    within(".new_client") do
      fill_in("Name", with: "Client")
      fill_in("Phone", with: "5124242424")
      fill_in("Email", with: "new.client@nclient.com")
      select "wash", :from => "client[business_id]"
      fill_in("Password", with: "password")
      fill_in("Password Confirmation", with: "password")
    end

    click_on("Sign up")

    expect(page).to have_content "Welcome! You have signed up successfully.

"
  end


scenario "Invalid client can register" do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    visit new_client_registration_path
    within(".new_client") do
      fill_in("Name", with: "Client")
      fill_in("Phone", with: "5124242424")
      select "wash", :from => "client[business_id]"
      fill_in("Password", with: "password")
      fill_in("Password Confirmation", with: "password")
    end

    click_on("Sign up")

    expect(page).to have_content "Email can't be blank"
  end

end
