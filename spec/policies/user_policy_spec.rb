require "rails_helper"

describe UserPolicy do
  subject(:policy) { described_class.new(user: user) }

  let(:user) { build_stubbed(:user, role: role) }
  let(:role) { "teacher" }

  describe "#index?" do
    subject { policy.apply(:index?) }

    context "when current user is teacher" do
      it { is_expected.to be_falsey }
    end

    context "when current user director" do
      let(:role) { "director" }

      it { is_expected.to be_truthy }
    end
  end
end
