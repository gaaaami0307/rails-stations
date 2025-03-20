# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Movie.destroy_all
Movie.create!(name:"railsに苦しむ:序", year:2025, description:"Techtrainでrailsに苦しみ、挫折するお話", image_url:"https://picsum.photos/200/300", is_showing:true)
Movie.create!(name:"railsに苦しむ:中", year:2025, description:"TechTrainのruby入門のおかげでモチベを取り戻すお話", image_url:"https://picsum.photos/200/300", is_showing:true)
Movie.create!(name:"railsに苦しむ:結", year:2025, description:"Techtrainでrailsを制覇するお話", image_url:"https://picsum.photos/200/300", is_showing:false)