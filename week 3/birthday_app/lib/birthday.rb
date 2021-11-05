class Birthday

  attr_reader :day, :month

  def initialize(day, month)
    @day = day
    @month = month
  end

  def calculate(today)
    current_day = today.mday
    current_month = today.mon

    days_left = @day - current_day
    months_left = @month - current_month

    months_left < 0 ? months_left = -(months_left) : nil

    total_days_left = days_left + (months_left * 30)

  end

  
end