# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(username:"Cartman" , password: "12345", bio: "I'm an impatient and intolerant fatass", profile_pic:"http://southparkstudios.mtvnimages.com/images/shows/south-park/episode-thumbnails/season-15/south-park-s15e04-tmi_4x3.jpg" , email: "theman@gmail.com")

u2 = User.create(username:"Kyle" , password:"12345" , bio:"I love to wear a green hat to cover up my curly red hair" , profile_pic:"data:image/jpeg;base64,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" , email:"shiver_me_timbers@gmail.com")

u3 = User.create(username:"Stan" , password:"12345" , bio:"Seeking the meaning of life." , profile_pic:"https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTDQuklCcxg7h2DFepl93L-ilIbldEEbJkhqLvkB0n8gITjDVlC" , email:"ballIsLife@gmail.com")

u4 = User.create(username:"Kenny" ,password:"12345" , bio:"I mumble a lot, and Cartman is a jackass" , profile_pic:"http://www.southpark.com.br/wp-content/uploads/2012/06/kenny-south-park.jpg" , email:"respectmyauthority@gmail.com")

u5 = User.create(username:"Chef" ,password:"12345" , bio:"Hello Children" , profile_pic:"http://southparkstudios.mtvnimages.com/shared/characters/adults/chef.png" , email:"respectmyauthority@gmail.com")


t1 = Trip.create(title:"Life changing experiences" , location:"Peru" , duration:"2 weeks" , summary:"Spend most of my days in the woods, having wacky experiences using Ayawaska" , budget: 2000, video_url:"www.longliveflash.com" )

t2 = Trip.create(title:"Guided by the natives" , location:"Spain" , duration:"4 weeks" , summary:"Spent all of my time going on guided tours viewing the natural and historical sights" ,budget: 4000, video_url:"www.longliveflash.com" )

t3 = Trip.create(title:"New Explorations" , location:"South Africa" , duration:"1 week" , summary:"Surf and drink all day" , budget: 1500 , video_url:"www.longliveflash.com" )

t4 = Trip.create(title:"Home" , location:"Colorodo" , duration:"All day" , summary:"Kicking it by the TV, because I'm too poor to travel" , budget: 5 , video_url:"www.longliveflash.com" )


e1 = Entry.create(title:"Good times" ,location:"Machu Pichu" ,summary:"Went hiking all day" ,cost: 0 ,image:"https://d1ciw9phtlkz3p.cloudfront.net/events/machu-picchu-peru.jpg" ,video_url: "NA" ,date: "10/20/15")

e2 = Entry.create(title:"Barcelona Game!!!" ,location:"Barcelona" ,summary:"Had the best food of my life." ,cost:3000 ,image:"http://cache-graphicslib.viator.com/graphicslib/thumbs360x240/2512/SITours/barcelona-modernism-and-gaudi-walking-tour-in-barcelona-168394.jpg" ,video_url: "N/A" ,date:"11/14/15")

e3 = Entry.create(title:"Surf all day" ,location:"Cape Town" ,summary:"Refer to title" ,cost: 0 ,image:"http://www.travelstart.co.za/blog/wp-content/uploads/2013/11/Greg-Lumley.jpg" ,video_url:"N/A" ,date:"1/30/15")

e4 = Entry.create(title:"Stay at home" ,location:"South Park" ,summary:"Watching TV all day" ,cost: 5 ,image:"http://i.huffpost.com/gen/1758090/thumbs/o-COLORADO-SUNSHINE-570.jpg?2" ,video_url:"N/A" ,date:"9/2/15")




u1.trips << t1
u1.trips << t2
u2.trips << t2
u3.trips << t3
u4.trips << t4
u5.trips << t1

t1.entries << e1
t2.entries << e2
t2.entries << e2
t3.entries << e4
t4.entries << e4
t1.entries << e3
t1.entries << e2