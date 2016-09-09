require 'rails_helper'

describe "create a new user process" do
  it "adds a new user to the database" do
    visit new_user_path
    fill_in 'Email', :with => "TestUserEmail@gmail.com"
    fill_in 'Password', :with => "abcde1234"
    click_on 'Create User'
    expect(page).to have_content 'Welcome!'
  end
end
