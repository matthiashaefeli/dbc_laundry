require 'rails_helper'

feature "visiting the clients homepage" do
  scenario "Client can navigate to log in" do
    visit "/"

    within("body") do
      click_link("Login")
    end

    expect(page).to have_current_path new_client_session_path
  end

  scenario "Client can navigate to register" do
    visit "/"

    within("body") do
      click_link("Register")
    end

    expect(page).to have_current_path new_client_registration_path
  end
end

