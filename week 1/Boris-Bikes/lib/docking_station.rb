require_relative './bike.rb'

class DockingStation

  attr_reader :bikes

    def initialize
      @bikes = []
    end


    def release_bike
      fail "no bikes" unless @bikes.length != 0
      @bikes.pop
    end 

    def dock_bike(bike)
      fail "too many bikes" if self.full?
      @bikes.push(bike)
      bike
    end

    def full?
      @bikes.length>= 20
    end

end 