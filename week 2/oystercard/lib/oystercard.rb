class Oystercard
  LIMIT = 90
  MIN_FARE = 1

  attr_reader :balance, :limit

  def initialize
    @balance = 0
    @limit = LIMIT
    @in_journey = false
  end

  def top_up(amount)
    fail "Cannot top up anymore - you will exceed your limit of #{LIMIT}" if amount + balance > LIMIT
    @balance += amount
  end

  def deduct(amount)
    fail "Cannot deduct anymore - you will have a negative balance" if balance - amount < 0
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Insufficient funds to touch in" if @balance < MIN_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end