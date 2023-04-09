require "rails_helper"

describe OrganizationSubjects::SaveRecord do
  include_context "with interactor"

  describe ".call" do
    let(:initial_context) do
      {
        organization_subject: organization_subject,
        organization_subject_params: organization_subject_params
      }
    end
    let(:organization_subject_params) do
      {
        subject: new_subject,
        organization: new_organization
      }
    end
    let(:new_subject) { create(:subject, name: "English") }
    let(:new_organization) { create(:organization, name: "School №102") }

    context "when update organization subject" do
      let!(:organization_subject) do
        create(:organization_subject)
      end

      it "updates organization subject" do
        expect { interactor.run }.not_to change(OrganizationSubject, :count)
        expect(organization_subject.reload).to have_attributes(organization_subject_params)
      end
    end

    context "when create organization subject" do
      let(:organization_subject) { build(:organization_subject) }

      it "creates organization subject" do
        expect { interactor.run }.to change(OrganizationSubject, :count).by(1)
        expect(organization_subject.reload).to have_attributes(organization_subject_params)
      end
    end

    context "when params is invalid" do
      let(:organization_subject) { build(:organization_subject) }
      let(:organization_subject_params) { { organization: nil, subject: nil } }
      let(:error_data) do
        {
          message: "OrganizationSubject invalid",
          detail: ["Organization must exist", "Subject must exist"]
        }
      end

      it_behaves_like "failed interactor"
    end
  end
end
