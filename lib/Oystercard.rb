
class Oystercard

  attr_reader :balance, :max_balance, :status

  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @max_balance = MAX_BALANCE
    @status = false
  end

  def in_journey?
    @status
  end

  def touch_in
    @status = true
  end

  def touch_out
    @status = false
  end

  def top_up(money)
    @balance += money
    limit_exceeded(money)
    balance_message
  end

  def deduct(fare)
    @balance -= fare
    balance_message
  end  

  
  
  
  private

  def limit_exceeded(money)
    (@balance = @max_balance; raise "Top-up limit exceeded") if @balance > @max_balance
  end

  def balance_message
    "Your balance is now £#{@balance}"
  end


end