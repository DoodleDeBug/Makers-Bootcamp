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

    if days_left != 0 && current_month == @month
      months_left = 12
    elsif current_month > @month
      months_left = (12 - current_month) + @month
    else
      months_left = @month - current_month
    end

    total_days_left = days_left + (months_left * 30)
  end

  
end