require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be_truthy }

  it "should hash a user's password" do
    password = "pass"
    user = User.create!(email: "hello@gmail.com", password: password)
    expect(user.password_digest).not_to eq(password)
  end
end