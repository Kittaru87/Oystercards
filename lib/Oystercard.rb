require_relative 'station'
require_relative 'journey'

class Oystercard
	attr_reader :balance, :track_history, :journey
	DEFAULT_BALANCE = 0
	MAXIMUM_BALANCE = 90
	MINIMUM_FARE = 1

	def initialize(balance = DEFAULT_BALANCE)
		@balance = balance
		@track_history = []
		@journey = Journey.new
	end

	def top_up(num)
		no_topup(num)
		@balance += num
		topup_message(num)
	end

	def touch_in(entry_station)
		no_funds
		@journey.start_journey(entry_station)
		touch_in_message(entry_station)
	end

	def touch_out(exit_station)
		@journey.end_journey(exit_station)
		@balance -= @journey.fare
		touch_out_message(exit_station)
	end

	private

	def no_funds
		fail "You have insufficient funds" if @balance < MINIMUM_FARE
	end

	def no_topup(num)
		fail "You cant top up more than #{MAXIMUM_BALANCE} balance" if (@balance + num) > MAXIMUM_BALANCE
	end

	def topup_message(num)
		"You have topped up by £#{num}"
	end

	def touch_in_message(entry_station)
		"You have tapped into #{entry_station}"
	end

	def touch_out_message(exit_station)
		"You have tapped out of #{exit_station}"
	end
end
