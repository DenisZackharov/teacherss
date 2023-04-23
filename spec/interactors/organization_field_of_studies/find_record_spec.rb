require "rails_helper"

describe OrganizationFieldOfStudies::FindRecord do
  include_context "with interactor"

  describe ".call" do
    let(:initial_context) do
      {
        field_of_study: field_of_study,
        organization: organization
      }
    end

    let(:field_of_study) { create(:field_of_study) }
    let(:organization) { create(:organization) }

    context "when organization field of study exist" do
      let!(:organization_field_of_study) do
        create(:organization_field_of_study, organization: organization, field_of_study: field_of_study)
      end

      it { expect(executed_context.organization_field_of_study).to eq(organization_field_of_study) }
    end

    context "when organizarion field of study doesn't exist" do
      let(:error_data) do
        {
          message: "Organization Field Of Study not found"
        }
      end

      it_behaves_like "failed interactor"
    end
  end
end
