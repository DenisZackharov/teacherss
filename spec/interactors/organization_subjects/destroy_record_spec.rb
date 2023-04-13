require "rails_helper"

describe OrganizationSubjects::DestroyRecord do
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
      before do
        create(:organization_subject, organization: organization, subject: test_subject)
      end

      it "destroyes subject" do
        expect { interactor.run }.to change(OrganizationSubject, :count).from(1).to(0)
      end
    end

    context "when organizarion subject doesn't exist" do
      it "raises a RecordNotFound error" do
        expect { interactor.run }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end
end
