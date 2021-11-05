require 'birthday'

describe Birthday do

  subject(:bday) { Birthday.new(8, 11) }
  
  it 'has a day instance variable' do
    expect(bday.day).to eq(5)
  end

  it 'has a month instance variable' do
    expect(bday.month).to eq(1)
  end

  it 'calculates the days till your birthday' do
    today = double("Date.today", :mday => 8, :mon => 11)

    expect(bday.calculate(today)).to eq(0)
  end

  it 'calculates the days till your birthday' do
    today = double("Date.today", :mday => 1, :mon => 11)

    expect(bday.calculate(today)).to eq(7)
  end

  it 'calculates the days till your birthday' do
    today = double("Date.today", :mday => 8, :mon => 12)

    expect(bday.calculate(today)).to eq(330)
  end

  it 'calculates the days till your birthday' do
    today = double("Date.today", :mday => 5, :mon => 11)

    expect(bday.calculate(today)).to eq(363)
  end

  it 'calculates the days till your birthday' do
    today = double("Date.today", :mday => 10, :mon => 11)

    expect(bday.calculate(today)).to eq(358)
  end

end
