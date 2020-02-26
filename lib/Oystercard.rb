require_relative 'station'

class OysterCard
	attr_reader :balance, :entry_station, :exit_station, :track_history
	DEFAULT_BALANCE = 0
	MAXIMUM_BALANCE = 90
	MINIMUM_FARE = 1

	def initialize(balance = DEFAULT_BALANCE)
		@balance = balance
		@entry_station 
		@exit_station
		@track_history = []
	end

	def top_up(num)
		fail "You cant top up more than #{MAXIMUM_BALANCE} balance" if (@balance + num) > MAXIMUM_BALANCE
		@balance += num
	end

	def touch_in(entry_station)
		fail "You have insufficient funds" if @balance < MINIMUM_FARE 
		@entry_station = entry_station
		@exit_station = nil
		"You have tapped into #{entry_station}"
	end

	def touch_out(exit_station)
		deduct if in_journey?
		record_journey(exit_station)
		"You have tapped out of #{exit_station}"
	end

	def in_journey?
		raise 'You are not in journey' unless @entry_station
		true if @entry_station
	end

	private

    def deduct
		@balance -= MINIMUM_FARE
	end

	def record_journey(exit_station)
	   @track_history << {@entry_station => exit_station}
	   @entry_station = nil 
	   @exit_station = exit_station
	end



end
