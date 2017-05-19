require 'rails_helper'

feature "visiting the admin homepage" do
  scenario "User can navigate to log in" do
    visit "/"

    within(".footer") do
      click_link("Admin Login")
    end

    expect(page).to have_current_path new_admin_session_path
  end

end
