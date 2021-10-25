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
end