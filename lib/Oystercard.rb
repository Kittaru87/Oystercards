
class Oystercard

  attr_reader :balance, :max_balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @max_balance = MAX_BALANCE
  end

  def top_up(money)
    @balance += money
    limit_exceeded(money)
    "You have topped up by £#{@balance}"
  end

  def deduct(fare)
    @balance -= fare
    "Your balance is now £#{@balance}"
  end  

  private

  def limit_exceeded(money)
    (@balance = @max_balance; raise "Top-up limit exceeded") if @balance > @max_balance
  end


end