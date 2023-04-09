require "rails_helper"

describe FieldOfStudy do
  it "has a valid factory" do
    expect(build(:field_of_study)).to be_valid
  end
end
