require "rails_helper"

describe UserDecorator do
  subject(:decorator) { described_class.new(user) }

  let(:user) do
    build_stubbed(
      :user,
      first_name: "Alexander",
      last_name: "Pushkin",
      middle_name: "Sergeevich",
      role: "head_teacher"
    )
  end

  describe "#first_name_last_name" do
    let(:expected_first_name_last_name) { "Alexander Pushkin" }

    it "returns first name and last name" do
      expect(decorator.first_name_last_name).to eq(expected_first_name_last_name)
    end
  end

  describe "#full_name" do
    let(:expected_full_name) { "Pushkin Alexander Sergeevich" }

    it "returns full name" do
      expect(decorator.full_name).to eq(expected_full_name)
    end

    context "without middle name" do
      let(:user) do
        create(:user, first_name: "Alexander", last_name: "Pushkin", role: "head_teacher")
      end
      let(:expected_full_name) { "Pushkin Alexander" }

      it "returns full name" do
        expect(decorator.full_name).to eq(expected_full_name)
      end
    end
  end

  describe "#last_name_with_initials" do
    let(:expected_last_name_with_initials) { "Pushkin A. S." }

    it "returns fido" do
      expect(decorator.last_name_with_initials).to eq(expected_last_name_with_initials)
    end

    context "without middle name" do
      let(:user) do
        create(:user, first_name: "Alexander", last_name: "Pushkin")
      end

      let(:expected_last_name_with_initials) { "Pushkin A." }

      it "returns fido" do
        expect(decorator.last_name_with_initials).to eq(expected_last_name_with_initials)
      end
    end
  end

  describe "#role" do
    let(:expected_role) { "Head teacher" }

    it "returns role" do
      expect(decorator.role).to eq(expected_role)
    end
  end
end
