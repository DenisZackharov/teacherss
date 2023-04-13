require "rails_helper"

describe SubjectPolicy do
  subject(:policy) { described_class.new(user: user) }

  let(:user) { build_stubbed(:user, role: role) }
  let(:role) { "teacher" }

  describe "#create?" do
    subject { policy.apply(:create?) }

    context "when current user is teacher" do
      it { is_expected.to be_falsey }
    end

    context "when current user director" do
      let(:role) { "director" }

      it { is_expected.to be_truthy }
    end
  end

  describe "#update?" do
    let(:described_method) { :update? }

    it "is an alias of :create? authorization rule" do
      expect(described_method).to be_an_alias_of(policy, :create?)
    end
  end

  describe "#destroy?" do
    let(:described_method) { :destroy? }

    it "is an alias of :create? authorization rule" do
      expect(described_method).to be_an_alias_of(policy, :create?)
    end
  end
end
