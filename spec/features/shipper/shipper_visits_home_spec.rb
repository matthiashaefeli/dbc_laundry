require 'rails_helper'

feature "visiting the shipper homepage" do
  scenario "Shipper can navigate to log in" do
    visit "/"

    within(".footer") do
      click_link("Shipper Login")
    end

    expect(page).to have_current_path new_shipper_session_path
  end

end
