require 'rails_helper'

describe "login as a registered user process" do
  it "logs the user into the site" do
    visit new_login_path
    test_user = User.create(:email => "TestUserEmail@gmail.com", :password => "abcde1234")
    fill_in 'Email', :with => "TestUserEmail@gmail.com"
    fill_in 'Password', :with => "abcde1234"
    click_on 'signin'
    expect(page).to have_content 'Welcome!'
  end
end

describe "logout process" do
  it "logs the user out" do
    visit new_login_path
    test_user = User.create(:email => "TestUserEmail@gmail.com", :password => "abcde1234")
    fill_in 'Email', :with => "TestUserEmail@gmail.com"
    fill_in 'Password', :with => "abcde1234"
    click_on 'signin'
    click_on 'Log Out'
    expect(page).to have_content 'Thanks for visiting, come back soon'
  end
end
