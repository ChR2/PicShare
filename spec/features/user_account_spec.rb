require 'features/helper'

describe "User Account Spec" do
  describe "Creating an Account" do
    it "Persists the user in the database" do
      visit root_path
      click_link_or_button "create_account"

      fill_in "user_email", with: "me@mail.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with "password"

      click_link_or_button "Sign Up"

      expect(page).to have_contect("Account created for me@example.com")
      expect(User.exists?(email_address: "me@example")).to be_truthy
      expect(current_path).to eq(root_path)
    end
  end
end