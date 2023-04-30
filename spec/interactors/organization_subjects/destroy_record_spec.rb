require "rails_helper"

describe OrganizationSubjects::DestroyRecord do
  include_context "with interactor"

  describe ".call" do
    let(:initial_context) do
      {
        organization_subject: organization_subject
      }
    end

    let!(:organization_subject) { create(:organization_subject) }

    it "destroyes subject" do
      expect { interactor.run }.to change(OrganizationSubject, :count).from(1).to(0)
      expect(organization_subject).to be_destroyed
    end
  end
end
