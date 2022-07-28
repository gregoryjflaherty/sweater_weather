class TripCreator
  attr_accessor :trip, :trip_user

  def initialize(param_data, current_user)
    @trip = create_trip(param_data)
    @trip_user = create_trip_user(current_user)
  end
  
  def create_trip(param_data)
    Trip.create!(
      start_loc: param_data[:data][:attributes][:start_city],
      end_loc: param_data[:data][:attributes][:end_city],
      travel_time: param_data[:data][:attributes][:travel_time])
  end 
    
  def create_trip_user(current_user)
    TripUser.create!(
            user_id: current_user.id,
            trip_id: @trip.id,
            role: 2,
            invite_status: nil)
  end

  rescue ActiveRecord::RecordNotUnique
    render json: {message: "Trip already created"}, status: 400
end