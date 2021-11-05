require 'date'

class Birthday

  attr_reader :day, :month

  def initialize(day, month)
    @day = day
    @month = month
  end

  def calculate
    current_day = Date.today.mday
    current_month = Date.today.mon

  end

  
end