require "rails_helper"

describe OrganizationSubjects::FindRecord do
  include_context "with interactor"

  describe ".call" do
    let(:initial_context) do
      {
        subject: test_subject,
        organization: organization
      }
    end

    let(:test_subject) { create(:subject) }
    let(:organization) { create(:organization) }

    context "when organization subject exist" do
      let!(:organization_subject) { create(:organization_subject, organization: organization, subject: test_subject) }

      it { expect(executed_context.organization_subject).to eq(organization_subject) }
    end

    context "when organizarion subject doesn't exist" do
      let(:error_data) do
        {
          message: "Organization Subject not found"
        }
      end

      it_behaves_like "failed interactor"
    end
  end
end
