feature "visiting the shipper homepage" do
  scenario "Shipper can navigate to log in" do
    business = Business.create(name: "wash", email: "wash@wash.com", hash_password: "password")
    Client.create(name: "Client", phone: "1231234123", business: business, email: "client@client.com", encrypted_password: "password")
    visit new_client_session_path

    within(".new_client") do
      fill_in("Email", with: 'client@client.com')
      fill_in("Password", with: 'password')
    end
    click_on('Log in')

    expect(page).to have_current_path root_path
  end

end
