# require 'rails_helper'

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