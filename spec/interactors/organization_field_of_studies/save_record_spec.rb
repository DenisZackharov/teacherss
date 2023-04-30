require "rails_helper"

describe OrganizationFieldOfStudies::SaveRecord do
  include_context "with interactor"

  describe ".call" do
    let(:initial_context) do
      {
        organization_field_of_study: organization_field_of_study,
        organization_field_of_study_params: organization_field_of_study_params
      }
    end
    let(:organization_field_of_study_params) do
      {
        field_of_study: field_of_study,
        organization: new_organization
      }
    end
    let(:field_of_study) { create(:field_of_study, name: "Base") }
    let(:new_organization) { create(:organization, name: "School №102") }

    context "when update organization field of study" do
      let!(:organization_field_of_study) { create(:organization_field_of_study) }

      it "updates organization field of study" do
        expect { interactor.run }.not_to change(OrganizationFieldOfStudy, :count)
        expect(organization_field_of_study.reload).to have_attributes(organization_field_of_study_params)
      end
    end

    context "when create organization field of study" do
      let(:organization_field_of_study) { build(:organization_field_of_study) }

      it "creates organization field of study" do
        expect { interactor.run }.to change(OrganizationFieldOfStudy, :count).by(1)
        expect(organization_field_of_study.reload).to have_attributes(organization_field_of_study_params)
      end
    end

    context "when params is invalid" do
      let(:organization_field_of_study) { build(:organization_field_of_study) }
      let(:organization_field_of_study_params) { { organization: nil, field_of_study: nil } }
      let(:error_data) do
        {
          message: "Organization Field Of Study invalid",
          detail: ["Organization must exist", "Field of study must exist"]
        }
      end

      it_behaves_like "failed interactor"
    end
  end
end
