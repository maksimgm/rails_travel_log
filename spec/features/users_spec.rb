require 'rails_helper'

def user_login
  @user = User.create(username: "maksim", password: "secreto")
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
    expect(page).to have_content "Incorrent username or password"
  end

  scenario "login with a correct username and password" do
   user_login
   # save_and_open_page
   expect(page).to have_content "Welcome back"
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
    visit new_user_path
    expect(page.current_path).to eq root_path
  end
end





