require 'rails_helper'

RSpec.describe TripUser, type: :model do
  describe 'attributes' do
    it { should define_enum_for(:role) }
    it { should define_enum_for(:invite_status) }
  end

  describe 'relationships' do
    it { should belong_to(:user)}
    it { should belong_to(:trip)}
  end

  describe 'class methods' do
    before(:each) do 
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



        @trip_user1 = TripUser.create!(user_id: @user1.id, trip_id: @sd_denver.id, role: 2, invite_status: nil)
        @trip_user2 = TripUser.create!(user_id: @user1.id, trip_id: @miami_dallas.id, role: 1, invite_status: 0)
        @trip_user3 = TripUser.create!(user_id: @user1.id, trip_id: @chi_ny.id, role: 0, invite_status: 0)


        @trip_user4 = TripUser.create!(user_id: @user2.id, trip_id: @miami_dallas.id, role: 2, invite_status: nil)
        @trip_user5 = TripUser.create!(user_id: @user2.id, trip_id: @chi_ny.id, role: 1, invite_status: 0)
        @trip_user6 = TripUser.create!(user_id: @user2.id, trip_id: @sd_denver.id, role: 0, invite_status: 0)

        @trip_user7 = TripUser.create!(user_id: @user2.id, trip_id: @chi_ny.id, role: 2, invite_status: nil)
        @trip_user8 = TripUser.create!(user_id: @user2.id, trip_id: @sd_denver.id, role: 1, invite_status: 0)
        @trip_user9 = TripUser.create!(user_id: @user2.id, trip_id: @miami_dallas.id, role: 0, invite_status: 0)
    end
    
    it 'returns outgoing requests' do
      expect(TripUser.outgoing_invites(@user1)).to eq([@trip_user6, @trip_user8])
    end 
  end
end
