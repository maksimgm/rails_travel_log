require 'rails_helper'

# feature "update an existing student" do
#   let(:student){Student.create(first_name:"test",last_name:"user")}
#   scenario "sucessfully updating" do
#     visit edit_student_path(student)
#     within "form" do
#       fill_in "First name", with: "awesome"
#       fill_in "Last name", with: "sauce"
#     end
#     click_button "Update Student"
#     student.reload
#     expect(page).to have_content "Updated"
#     expect(student.first_name).to eq "awesome"
#     expect(student.last_name).to eq "sauce"
#   end
# end

def user_login
  @user = User.create(username: "maksim", password: "secreto", bio: "I got nothing", email: "umm@gmail.com", profile_pic: "Nada")
  # binding.pry
  visit login_path
  within "form" do
    fill_in "username", with: @user.username
    fill_in "password", with: "secreto"
  end
  click_button "Log in"
end

feature "visit the create new trip page" do
  background do
    user_login
    save_and_open_page
    click_on "Create New Trip"
    expect(page).to have_content "Create New Trip"
    # how to pass in user id 
    expect(page.current_path).to eq new_user_trip_path(@user)
  end

  scenario "create a new trip" do
    within "form" do
      fill_in "Title", with: "My first trip to Asia"
      fill_in "Location", with: "Thailand"
      fill_in "Summary", with: "Touring this country has given me an appreciation for my lavish life in the States"
    end
    click_button "Create Trip"
    # how to pass in user id and trip id
    expect(page.current_path).to eq trip_path(Trip.last)
  end
end


# feature "deleting a trip" do
#   background do
#     @trip = Trip.create(title:"My first trip to Asia", location:"Thailand", summary:"Touring this country has given me an appreciation for my lavish life in the States")    
#   end

#   scenario "deleting an existing trip" do
#     visit root_path
#   end
# end

# # feature "editing a trip" do

# # end