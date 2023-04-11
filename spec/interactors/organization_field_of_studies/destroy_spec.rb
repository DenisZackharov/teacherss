require "rails_helper"

describe OrganizationFieldOfStudies::Destroy do
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

    before do
      create(:organization_field_of_study, organization: organization, field_of_study: field_of_study)
    end

    it "destroyes field of study" do
      expect { interactor.run }.to change(OrganizationFieldOfStudy, :count).from(1).to(0)
    end
  end
end
