module InterestsHelper
    def update_seats_number
        @ride = @interest[0].ride
        @ride.seats_available += 1
        @ride.save
    end
end
