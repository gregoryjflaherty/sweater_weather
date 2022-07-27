# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user1 = User.create!(email: "fake@example.com", password_digest: 'something_here')
@user2 = User.create!(email: "somebodyelse@example.com", password_digest: 'crazy_password')


@sd_denver = Trip.create!(start_loc: "San Diego, CA", end_loc: "Denver, CO", 
                          travel_time: '2 hours 13 minutes', rating: 4.8)

TripUser.create!(user_id: @user1.id, trip_id: @sd_denver.id, role: 2, is_a_favorite: true, invite_status: nil)
TripUser.create!(user_id: @user2.id, trip_id: @sd_denver.id, role: 0, is_a_favorite: false, invite_status: 1)




