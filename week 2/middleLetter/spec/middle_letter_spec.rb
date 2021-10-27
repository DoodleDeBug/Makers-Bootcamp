require_relative './../lib/middle_letter.rb'

describe "get_middle" do
  
  it 'returns the middle letter of a word with an odd length' do
    expect(get_middle("testing")).to eq("t")
  end

  it 'returns the middle two letters of a word with an even length' do
    expect(get_middle("test")).to eq("es")
  end

end