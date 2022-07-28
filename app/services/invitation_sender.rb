class InvitationSender
    attr_accessor :trip, :trip_user

    def initialize(param_data)
        @trip_id = get_trip_id(param_data[:id])
        @recipient = param_data[:recipient_id]
        @invitation = send_invite(param_data[:role])
    end 

    def get_trip_id(trip_user_id)
       TripUser.find_by(id: trip_user_id).trip_id 
    end

    def send_invite(role)
        TripUser.create!(trip_id: @trip_id,
                        user_id: @recipient,
                        role: role,
                        invite_status: 0)
    end 
end