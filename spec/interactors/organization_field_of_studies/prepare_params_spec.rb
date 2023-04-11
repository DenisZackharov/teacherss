require "rails_helper"

describe OrganizationFieldOfStudies::PrepareParams do
  include_context "with interactor"

  describe ".call" do
    let(:initial_context) do
      {
        field_of_study: field_of_study,
        organization: organization
      }
    end

    let(:field_of_study) { build_stubbed(:field_of_study) }
    let(:organization) { build_stubbed(:organization) }

    it { expect(executed_context.organization_field_of_study_params).to eq(initial_context) }
  end
end
