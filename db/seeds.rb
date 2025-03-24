# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Sheet.create(column:1, row:'a');
Sheet.create(column:1, row:'b');
Sheet.create(column:1, row:'c');
Sheet.create(column:1, row:'d');
Sheet.create(column:1, row:'e');
Sheet.create(column:2, row:'a');
Sheet.create(column:2, row:'b');
Sheet.create(column:2, row:'c');
Sheet.create(column:2, row:'d');
Sheet.create(column:2, row:'e');
Sheet.create(column:3, row:'a');
Sheet.create(column:3, row:'b');
Sheet.create(column:3, row:'c');
Sheet.create(column:3, row:'d');
Sheet.create(column:3, row:'e');