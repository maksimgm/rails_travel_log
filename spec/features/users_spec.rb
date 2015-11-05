require 'rails_helper'
# LOGGING IN, LOGGING OUT AND AUTHORIZATION

def user_login
  @user = User.create(username: "maksim", password: "secreto", bio: "I got nothing", email: "umm@gmail.com")
  visit login_path
  within "form" do
    fill_in "username", with: "maksim"
    fill_in "password", with: "secreto"
  end
  click_button "Log in"
end

feature "logging in" do 
  background do
    visit login_path
  end


  scenario "login with no username or password" do
    within "form" do
      fill_in "username", with: ""
      fill_in "password", with: ""
    end
    click_button "Log in"
    expect(page).to have_content "Please enter your username and password"
  end

  scenario "login with an incorrect username or password" do
    within "form" do
      fill_in "username", with: "maksim"
      fill_in "password", with: "shinanagins"
    end
    click_button "Log in"
    # save_and_open_page
    expect(page).to have_content "Incorrect username or password"
  end

  scenario "login with a correct username and password" do
   user_login
   # save_and_open_page
   expect(page).to have_content "User logged in: maksim"
   expect(page.current_path).to eq root_path
  end
end


feature "logging out" do
  background do
    user_login
  end

  scenario "user logs out" do
    expect(page.current_path).to eq root_path
    click_link "Logout"
    expect(page.current_path).to eq login_path
  end
end

feature "authorization for users who are not logged in" do
  scenario "attempt to access the home page without being logged in" do
    visit root_path
    expect(page).to have_content "Please log in"
    expect(page.current_path).to eq login_path
  end
end

feature "authorization for logged in users" do
  background do
    user_login
  end

  scenario "attempt to sign up or log in after signing up" do
    expect(page.current_path).to eq root_path
    visit login_path
    expect(page.current_path).to eq root_path
    visit signup_path
    expect(page.current_path).to eq root_path
  end
end

# SIGNING UP

feature "signing up" do
  background do
    visit signup_path
  end

  scenario "signing up without a username, password, bio, profile_pic, or email" do
    within "form" do
      fill_in "user_username", with: ""
      fill_in "user_password", with: ""
      fill_in "user_bio", with: ""
      fill_in "user_email", with: ""
    end
    click_button "Signup"
  end

  scenario "signing up with an existing username " do
    another_user = User.create(username: "maksim", password: "secreto", bio: "I got nothing", email: "umm@gmail.com")
    within "form" do
      fill_in "user_username", with: another_user.username
      fill_in "user_password", with: another_user.username
      fill_in "user_bio", with: another_user.bio
      fill_in "user_email", with: another_user.email
    end
      click_button "Signup"
      expect(page).to have_content "Username has already been taken"  
  end

  scenario "signing up with a corrent username and password" do
    within "form" do
    fill_in "user_username", with: "maksim"
    fill_in "user_password", with: "secreto"
    fill_in "user_bio", with: "I got nothing"
    fill_in "user_email", with: "umm@gmail.com"
  end
    click_button "Signup"
    expect(page).to have_content "User logged in: maksim"
  end

end
