require 'remembering_names'

describe "the add_name method" do
  it "gives us a friendly message" do
    expect(add_name("bob")).to eq "Name added"
  end
end

# describe "the show_names method" do
#   it "gives us an array" do
#     expect(show_names).to be_an_instance_of(Array)
#   end
# end