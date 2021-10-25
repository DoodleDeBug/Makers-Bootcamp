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
end