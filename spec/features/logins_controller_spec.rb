require 'rails_helper'

describe "login as a registered user process" do
  it "logs the user into the site" do
    visit new_login_path
    test_user = User.create(:email => "TestUserEmail@gmail.com", :password => "abcde1234")
    fill_in 'Email', :with => "TestUserEmail@gmail.com"
    fill_in 'Password', :with => "abcde1234"
    click_on 'signin'
    expect(page).to have_content 'It Takes a Village'
  end
end
