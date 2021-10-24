require './../lib/docking_station.rb'
require './../lib/bike.rb'

describe DockingStation do
    it "responds to release_bike" do 
        expect(subject).to respond_to(:release_bike)
    end 

    it "gets a bike" do
      bike = Bike.new
      subject.dock_bike(bike)
        expect(subject.release_bike).to be_instance_of Bike
    end

    it "is working" do
      subject.dock_bike(Bike.new)
        bike = subject.release_bike
        expect(bike).to be_working 
    end

    it "responds to docking a bike" do
      bike = Bike.new
      expect(subject.dock_bike(bike)).to eq bike
    end

    it "returns bikes" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.bikes).to eq [bike]
    end

    it "raises error when trying to release bike from empty docking station" do
      docking_station = DockingStation.new
      expect {subject.release_bike}.to raise_error("no bikes")
    end

    it "raises error when docking bike to full docking station" do
      bike = Bike.new
      20.times { subject.dock_bike(bike) }
      expect {subject.dock_bike(bike)}.to raise_error("too many bikes")
    end
end

