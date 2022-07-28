require 'rails_helper'

RSpec.describe Devise::SessionsController do
  before(:each) do
    @user1 = User.create!(
        email: "fake@user.com", 
        password: 'test123456', 
        password_confirmation: 'test123456')
    
    @user2 = User.create!(
        email: "fake@user2.com", 
        password: 'test123456', 
        password_confirmation: 'test123456')

    @user3 = User.create!(
        email: "fake@user3.com", 
        password: 'test123456', 
        password_confirmation: 'test123456')

    @sd_denver = Trip.create!(start_loc: "San Diego, CA", end_loc: "Denver, CO", 
                              travel_time: '8 hours 11 minutes', rating: 4.8)
    @miami_dallas = Trip.create!(start_loc: "Miami, FL", end_loc: "Dallas, TX", 
                              travel_time: '12 hours 33 minutes', rating: 4.2)
    @chi_ny = Trip.create!(start_loc: "Chicago, IL", end_loc: "New York, NY", 
                              travel_time: '10 hours 29 minutes', rating: 3.8)

    @trip_user1 = TripUser.create!(user_id: @user1.id, trip_id: @sd_denver.id, role: 2, invite_status: nil)
    @trip_user2 = TripUser.create!(user_id: @user1.id, trip_id: @miami_dallas.id, role: 1, invite_status: 0)
    @trip_user3 = TripUser.create!(user_id: @user1.id, trip_id: @chi_ny.id, role: 0, invite_status: 0)
    
    @trip_user4 = TripUser.create!(user_id: @user3.id, trip_id: @chi_ny.id, role: 2, invite_status: nil)
    
    @trip_user5 = TripUser.create!(user_id: @user2.id, trip_id: @sd_denver.id, role: 0, invite_status: 0)
    @trip_user6 = TripUser.create!(user_id: @user2.id, trip_id: @chi_ny.id, role: 0, invite_status: 0)


  end

  scenario 'Sad Path- Gets error without token', :vcr do
    @request_body = {
                     "email": 'fake@user.com',
                     "password": 'test123456',
                     }
                     
    post '/user/sign_in', :params => @request_body, as: :json
    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(expected.keys.length).to eq(3)
    
    

    get :new
    expected = JSON.parse(response.body, symbolize_names: true)
    expect(response).should be_redirect
    expect(response).to_not be_successful
  end
end