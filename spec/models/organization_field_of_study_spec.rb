require "rails_helper"

describe OrganizationFieldOfStudy do
  describe "validations" do
    it "has a valid factory" do
      expect(build(:organization_field_of_study)).to be_valid
    end

    context "when field of study and organization not unique" do
      subject(:organization_field_of_study) do
        build(
          :organization_field_of_study,
          organization: existed_organization_field_of_study.organization,
          field_of_study: existed_organization_field_of_study.field_of_study
        )
      end

      let!(:existed_organization_field_of_study) do
        create(:organization_field_of_study)
      end

      it { is_expected.not_to be_valid }

      it "has error message" do
        organization_field_of_study.validate

        expect(organization_field_of_study.errors.to_hash)
          .to eq(field_of_study_id: ["already exists for this organization"])
      end
    end
  end
end
