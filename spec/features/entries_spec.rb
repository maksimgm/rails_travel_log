require 'rails_helper'

feature "create a new entry" do
	background do
		visit new_user_trip_entry_path
	end

	scenario "creating a new entry with all required fields" do
		within "form" do
			fill_in "Title", with: "Hiking Machu Pichu"
			fill_in "Location", with: "Peru"
			fill_in "Summary", with: "I hiked Machu Pichu. That's it. End of conversation."
			fill_in "Cost", with: 1000
			fill_in "Image", with: "http://www.machupicchu.org/images/fondo-machu-picchu.jpg"
			fill_in "Video Url", with: "https://www.youtube.com/watch?v=_NqUHT4qE8w"
		end
		click_button "Create Entry"
		expect(page).to have_content "Entry created"
		expect(page.current_path).to eq user_trip_entries_path 
	end

	scenario "Creating a new entry without all required fields" do
		within form do
			fill_in "Title", with: ""
			fill_in "Location", with: ""
			fill_in "Summary", with: ""
			fill_in "Cost", with: 
			fill_in "Image", with: ""
			fill_in "Video Url", with: ""
		end
		click_button "Create Entry"
		expect(page).to have_content "Title can't be blank Location can't be blank Summary can't be blank Cost can't be blank Image can't be blank Video Url can't be blank"
	end
end

feature "Update an existing entry" do 
	let(:entry){Entry.create(title: "Hiking Machu Pichu", location: "Peru", summary: "I hiked Machu Pichu. That's it. End of conversation.", cost: 1000, image: "http://www.machupicchu.org/images/fondo-machu-picchu.jpg", video_url: "https://www.youtube.com/watch?v=_NqUHT4qE8w")}
	scenario "Successfully updating" do
		visit edit_user_trip_entry(entry)
		within "form" do
			fill_in "Title", with: "Making coca cola"
			fill_in "Location", with: "Colombia"
			fill_in "Summary", with: "I learned to make coca cola."
			fill_in "Cost", with: 10
			fill_in "Image", with: "https://upload.wikimedia.org/wikipedia/commons/d/dc/1BILLIONTHgallonCOCACOLAowner.jpg"
			fill_in "Video Url", with: "https://www.youtube.com/watch?v=yNYJG3WFPak"
		end

		click_button "Update Entry"
		entry.reload
		expect(page).to have_content "Entry Updated"
		expect(entry.title).to eq "Colombia"
		expect(entry.location).to eq "I learned to make coca cola."
		expect(entry.summary).to eq "I learned to make coca cola."
		expect(entry.cost).to eq 10
		expect(entry.image).to eq "https://upload.wikimedia.org/wikipedia/commons/d/dc/1BILLIONTHgallonCOCACOLAowner.jpg"
		expect(entry.video_url).to eq "https://www.youtube.com/watch?v=yNYJG3WFPak"
	end	
end

feature "Deleting an existing entry" do
	scenario "uccessfully deleting" do
		t = Trip.create(title: , location: , duration: , summary: , budget: , like: , video_url: )}
		t.entries.create(title: "Hiking Machu Pichu", location: "Peru", summary: "I hiked Machu Pichu. That's it. End of conversation.", cost: 1000, image: "http://www.machupicchu.org/images/fondo-machu-picchu.jpg", video_url: "https://www.youtube.com/watch?v=_NqUHT4qE8w")
		visit user_trip_entry_path
		click_button "Delete Entry"
		expect(page).to have_content "Entry Deleted"
		expect(Entry.all.size).to eq 1
		expect(t.entries.size).to eq 
	end
end
