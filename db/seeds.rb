# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#Movie.create!(name:"railsに苦しむ:序", year:2025, description:"Techtrainでrailsに苦しみ、挫折するお話", image_url:"https://picsum.photos/200/300", is_showing:true)
#Movie.create!(name:"railsに苦しむ:中", year:2025, description:"TechTrainのruby入門のおかげでモチベを取り戻すお話", image_url:"https://picsum.photos/200/300", is_showing:true)
#Movie.create!(name:"railsに苦しむ:結", year:2025, description:"Techtrainでrailsを制覇するお話", image_url:"https://picsum.photos/200/300", is_showing:false)

Movie.find(1).schedules.create(start_time: "14:00", end_time: "16:00")
Movie.find(1).schedules.create(start_time: "21:00", end_time: "22:00")
Movie.find(2).schedules.create(start_time: "12:00", end_time: "18:00")
Movie.find(3).schedules.create(start_time: "11:00", end_time: "19:00")

#Sheet.create(column:1, row:'a');
#Sheet.create(column:2, row:'a');
#Sheet.create(column:3, row:'a');
#Sheet.create(column:4, row:'a');
#Sheet.create(column:5, row:'a');
#Sheet.create(column:1, row:'b');
#Sheet.create(column:2, row:'b');
#Sheet.create(column:3, row:'b');
#Sheet.create(column:4, row:'b');
#Sheet.create(column:5, row:'b');
#Sheet.create(column:1, row:'c');
#Sheet.create(column:2, row:'c');
#Sheet.create(column:3, row:'c');
#Sheet.create(column:4, row:'c');
#Sheet.create(column:5, row:'c');