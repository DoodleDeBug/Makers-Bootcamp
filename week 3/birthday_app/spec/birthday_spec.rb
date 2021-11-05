require 'birthday'

describe Birthday do

  subject(:bday) { Birthday.new(5, 1) }
  
  it 'has a day instance variable' do
    expect(bday.day).to eq(5)
  end

  it 'has a month instance variable' do
    expect(bday.month).to eq(1)
  end

end
