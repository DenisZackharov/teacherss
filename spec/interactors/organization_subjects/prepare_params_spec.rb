require "rails_helper"

describe OrganizationSubjects::PrepareParams do
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

    it { expect(executed_context.organization_subject_params).to eq(initial_context) }
  end
end
