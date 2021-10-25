class Oystercard
  LIMIT = 90
  
  attr_reader :balance, :limit

  def initialize
    @balance = 0
    @limit = LIMIT
  end

  def top_up(amount)
    fail "Cannot top up anymore - you will exceed your limit of #{LIMIT}" if amount + balance > LIMIT
    @balance += amount
  end

  def deduct(amount)
    fail "Cannot deduct anymore - you will have a negative balance" if balance - amount < 0
    @balance -= amount
  end

end