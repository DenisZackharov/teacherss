require "rails_helper"

describe OrganizationSubjects::Destroy do
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

    before do
      create(:organization_subject, organization: organization, subject: test_subject)
    end

    it "destroyes subject" do
      expect { interactor.run }.to change(OrganizationSubject, :count).from(1).to(0)
    end
  end
end
