# frozen_string_literal: true

# This class describes an oystercard
class Oystercard
  LIMIT = 90
  MIN_FARE = 2

  attr_reader :balance, :limit

  def initialize
    @balance = 0
    @limit = LIMIT
    @in_journey = false
  end

  def top_up(amount)
    raise "Cannot top up anymore - you will exceed your limit of #{LIMIT}" if amount + balance > LIMIT

    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise 'Insufficient funds to touch in' if @balance < MIN_FARE

    @in_journey = true
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false
  end

  private

  def deduct(amount)
    raise 'Cannot deduct anymore - you will have a negative balance' if (balance - amount).negative?

    @balance -= amount
  end
end
