require_relative 'station'

class Journey

    attr_reader :entry_station, :exit_station

    MIN_FARE = 1
    PENALTY = 6
    
    def initialize
        @entry_station
        @exit_station
    end

    def start_journey(station)
        @entry_station = station
    end

    def end_journey(station)
        @exit_station = station
    end

    def complete?
        @entry_station && @exit_station
    end

    def fare
        complete? ? MIN_FARE : PENALTY
    end

end
