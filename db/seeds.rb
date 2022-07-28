# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user1 = User.create!(
        email: "greg@greg.com", 
        password: 'something_here', 
        password_confirmation: 'something_here')


@user2 = User.create!(
        email: "fake@example.com", 
        password: 'something_here', 
        password_confirmation: 'something_here')


@user3 = User.create!(
        email: "someoneelse@example.com", 
        password: 'something_here', 
        password_confirmation: 'something_here')


@sd_denver = Trip.create!(start_loc: "San Diego, CA", end_loc: "Denver, CO", 
                          travel_time: '8 hours 11 minutes', rating: 4.8)

@miami_dallas = Trip.create!(start_loc: "Miami, FL", end_loc: "Dallas, TX", 
                          travel_time: '12 hours 33 minutes', rating: 4.2)

@chi_ny = Trip.create!(start_loc: "Chicago, IL", end_loc: "New York, NY", 
                          travel_time: '10 hours 29 minutes', rating: 3.8)



TripUser.create!(user_id: @user1.id, trip_id: @sd_denver.id, role: 2, invite_status: nil)
TripUser.create!(user_id: @user1.id, trip_id: @miami_dallas.id, role: 1, invite_status: 0)
TripUser.create!(user_id: @user1.id, trip_id: @chi_ny.id, role: 0, invite_status: 0)


TripUser.create!(user_id: @user2.id, trip_id: @miami_dallas.id, role: 2, invite_status: nil)
TripUser.create!(user_id: @user2.id, trip_id: @chi_ny.id, role: 1, invite_status: 0)
TripUser.create!(user_id: @user2.id, trip_id: @sd_denver.id, role: 0, invite_status: 0)

TripUser.create!(user_id: @user2.id, trip_id: @chi_ny.id, role: 2, invite_status: nil)
TripUser.create!(user_id: @user2.id, trip_id: @sd_denver.id, role: 1, invite_status: 0)
TripUser.create!(user_id: @user2.id, trip_id: @miami_dallas.id, role: 0, invite_status: 0)




