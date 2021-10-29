# frozen_string_literal: true

class Oystercard
  LIMIT = 90
  MIN_FARE = 2

  attr_reader :balance, :limit, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
    @limit = LIMIT
    @journeys = []
   
  end

  def top_up(amount)
    raise "Cannot top up anymore - you will exceed your limit of #{LIMIT}" if amount + balance > LIMIT
    @balance += amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station)
    raise 'Insufficient funds to touch in' if @balance < MIN_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @exit_station = station
    record_current_journey
  end

  private

  def deduct(amount)
    raise 'Cannot deduct anymore - you will have a negative balance' if (balance - amount).negative?
    @balance -= amount
  end

  def record_current_journey
    @journeys << {:entry => @entry_station, :exit => @exit_station}
    @entry_station = nil
  end

end
