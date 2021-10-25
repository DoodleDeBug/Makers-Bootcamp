class Oystercard
  DEFAULT_BALANCE = 0
  LIMIT = 90
  
  attr_reader :balance, :limit

  def initialize
    @balance = DEFAULT_BALANCE
    @limit = LIMIT
  end

  def top_up(amount)
    if balance + amount > limit
      raise "Cannot top up anymore - you will exceed your limit of #{limit}"
    else
      @balance = balance + amount
    end
  end

end