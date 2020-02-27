require_relative 'station'

class Journey

    attr_reader :entry_station, :exit_station, :current_journey

    MIN_FARE = 1
    PENALTY = 6
    
    def initialize
        @entry_station
        @exit_station
        @current_journey = {departures: nil, arrivals: nil}
    end

    def start_journey(station)
        @entry_station = station.name
        @current_journey[:departures] = @entry_station
    end

    def end_journey(station)
        @exit_station = station.name
        @current_journey[:arrivals] = @exit_station
    end

    def complete?
        @entry_station && @exit_station
    end

    def in_journey?
        @current_journey.keys != [] ? true : false
    end

    def fare
        complete? ? MIN_FARE : PENALTY
    end

end
