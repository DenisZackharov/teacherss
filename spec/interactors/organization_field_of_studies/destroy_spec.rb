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

    context "when organization field of study exist" do
      before do
        create(:organization_field_of_study, organization: organization, field_of_study: field_of_study)
      end

      it "destroyes field of study" do
        expect { interactor.run }.to change(OrganizationFieldOfStudy, :count).from(1).to(0)
      end
    end

    context "when organizarion field of study doesn't exist" do
      it "raises a RecordNotFound error" do
        expect { interactor.run }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end
end
