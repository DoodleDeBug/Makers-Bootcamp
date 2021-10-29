require_relative './../lib/oystercard.rb'

describe Oystercard do
  it 'has a default balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'responds to top_up method' do
    card = Oystercard.new
    card.top_up(10)
    expect(card.balance).to eq(10)
  end

  it 'raises error if balance would exceed limit' do
    card = Oystercard.new
    subject.limit.times {card.top_up(1)} 
    expect {card.top_up(1)}.to raise_error("Cannot top up anymore - you will exceed your limit of #{subject.limit}")
  end

  it 'responds to deduct method' do
    card = Oystercard.new
    card.top_up(10)
    
    expect{card.deduct(10)}.to change {card.balance}.by(-10)
  end

  it 'raises error if deducting will lead to negative balance' do
    card = Oystercard.new
    card.top_up(10)
    expect {card.deduct(20)}.to raise_error("Cannot deduct anymore - you will have a negative balance")
  end

  it 'responds to in_journey?' do
    expect(subject.in_journey?).to eq(false)
  end

  it 'responds to touch_in' do
    card = Oystercard.new
    card.top_up(10)
    card.touch_in
    expect(card.in_journey?).to eq(true)
  end

  it 'responds to touch_out' do
    card = Oystercard.new
    card.top_up(10)
    card.touch_in
    card.touch_out
    expect(card.in_journey?).to eq(false)
  end

  describe '#touch_in' do
    it 'raises error if touch_in with balance less than the minimum fare' do
      expect {subject.touch_in}.to raise_error("Insufficient funds to touch in")
    end
  end

  describe '#touch_out' do
    it 'deducts minimum fare from balance' do
      card = Oystercard.new
      card.top_up(10)
      card.touch_in
      expect {card.touch_out}.to change {card.balance}.by(-Oystercard::MIN_FARE)
    end
  end


end