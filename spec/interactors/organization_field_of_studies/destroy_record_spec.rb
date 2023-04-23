require "rails_helper"

describe OrganizationFieldOfStudies::DestroyRecord do
  include_context "with interactor"

  describe ".call" do
    let(:initial_context) do
      {
        organization_field_of_study: organization_field_of_study
      }
    end

    let!(:organization_field_of_study) { create(:organization_field_of_study) }

    it "destroyes field of study" do
      expect { interactor.run }.to change(OrganizationFieldOfStudy, :count).from(1).to(0)
      expect(organization_field_of_study).to be_destroyed
    end
  end
end
