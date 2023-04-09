require "rails_helper"

describe OrganizationPolicy do
  subject(:policy) { described_class.new(record, user: current_user) }

  describe "#show?" do
    subject { policy.apply(:show?) }

    let(:record) { create(:organization) }

    context "when user from organization" do
      let(:current_user) { create(:user, organization: record) }

      it { is_expected.to be_truthy }
    end

    context "when user not from organization" do
      let(:organization) { create(:organization) }
      let(:current_user) { create(:user, organization: organization) }

      it { is_expected.to be_falsey }
    end
  end
end
