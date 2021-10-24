require_relative './../lib/bike.rb'

describe Bike do
  it "respond to working?" do 
    expect(subject).to respond_to(:working?)
end 
end

