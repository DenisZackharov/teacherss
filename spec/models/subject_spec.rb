require "rails_helper"

describe Subject do
  it "has a valid factory" do
    expect(build(:subject)).to be_valid
  end
end
