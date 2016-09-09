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

describe "update user info process" do
  it "udates the user info in the database" do
    user = User.create({:email => "test@testing.com",
                            :password => "testing4567abcd",
                            :name => "Test Buddy",
                            :about => "about user",
                            :skills => "user skills",
                            :profile_pic => "user pic",
                            :zip => "97217",
                            :likes_to => "do stuff",
                            })

    visit user_path(user)
    fill_in 'Name', :with => "Updated Name"
    fill_in 'Email', :with => "updatedemail@email.com"
    fill_in 'About', :with => "updated about"
    fill_in 'Profile pic', :with => "updated pic"
    fill_in 'Skills', :with => "updated skills"
    fill_in 'Zip', :with => "updated zip"
    fill_in 'Likes to', :with => "updated stuff"
    click_on "Update User"
    expect(page).to have_content "User info successfully updated!"
  end
end
