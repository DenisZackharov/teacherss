require "rails_helper"

describe UserDecorator do
  subject(:result) { user.decorate(context: { current_user: user }) }

  let(:user) do
    create(:user, first_name: "Aleksandr", last_name: "Pushkin", middle_name: "Sergeevich", role: "head_teacher")
  end

  describe "#first_name_last_name" do
    let(:expected_first_name_last_name) { "Aleksandr Pushkin" }

    it "return first name and last name" do
      expect(result.first_name_last_name).to eq(expected_first_name_last_name)
    end
  end

  describe "#full_name" do
    let(:expected_full_name) { "Pushkin Aleksandr Sergeevich" }

    it "return full name" do
      expect(result.full_name).to eq(expected_full_name)
    end

    context "when without middle name" do
      let(:user) do
        create(:user, first_name: "Aleksandr", last_name: "Pushkin", role: "head_teacher")
      end
      let(:expected_full_name) { "Pushkin Aleksandr" }

      it "return full name without middle name" do
        expect(result.full_name).to eq(expected_full_name)
      end
    end
  end

  describe "#role" do
    let(:expected_role) { "Head teacher" }

    it "return role" do
      expect(result.role).to eq(expected_role)
    end
  end
end
