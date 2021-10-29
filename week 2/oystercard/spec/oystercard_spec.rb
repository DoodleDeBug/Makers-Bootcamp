# frozen_string_literal: true

require_relative './../lib/oystercard'

describe Oystercard do

  let(:station) { double('station', name: 'Camden') }

  it 'has a default balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'responds to top_up method' do

    expect { subject.top_up(10) }.to change { subject.balance }.by(10)
  end

  it 'raises error if balance would exceed limit' do
    subject.top_up(subject.limit)
    expect { subject.top_up(1) }.to raise_error("Cannot top up anymore - you will exceed your limit of #{subject.limit}")
  end

  it 'responds to in_journey?' do
    expect(subject.in_journey?).to eq(false)
  end

  it 'responds to touch_in' do

    subject.top_up(10)
    subject.touch_in(station.name)
    expect(subject.in_journey?).to eq(true)
  end

  it 'responds to touch_out' do

    subject.top_up(10)
    subject.touch_in(station.name)
    subject.touch_out(station.name)
    expect(subject.in_journey?).to eq(false)
  end

  describe '#touch_in' do
    it 'raises error if touch_in with balance less than the minimum fare' do
      expect { subject.touch_in(station.name) }.to raise_error('Insufficient funds to touch in')
    end

    it 'remembers entry station when you touch_in' do
      subject.top_up(10)
      expect{subject.touch_in(station.name)}.to change{subject.entry_station}.to station.name
    end
  end

  describe '#touch_out' do
    it 'deducts minimum fare from balance' do

      subject.top_up(10)
      subject.touch_in(station.name)
      expect { subject.touch_out(station.name) }.to change { subject.balance }.by(-Oystercard::MIN_FARE)
    end

    it 'remembers exit station when you touch_out' do
      subject.top_up(10)
      subject.touch_in(station.name)
      expect{subject.touch_out(station.name)}.to change{subject.exit_station}.to station.name
    end
  end

  it 'has an empty list of journeys by default' do
    expect(subject.journeys).to be_empty
  end

  it 'stores current journey in journey array when touching out' do
    subject.top_up(10)
    subject.touch_in(station.name)
    subject.touch_out(station.name)

    expect(subject.journeys).not_to be_empty
  end

end
