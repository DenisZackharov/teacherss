require "rails_helper"

describe OrganizationSubject do
  it "has a valid factory" do
    expect(build(:organization_subject)).to be_valid
  end

  context "when subject and organization not unique" do
    subject(:organization_subject) do
      build(
        :organization_subject,
        organization: existed_organization_subject.organization,
        subject: existed_organization_subject.subject
      )
    end

    let!(:existed_organization_subject) do
      create(:organization_subject)
    end

    it { is_expected.not_to be_valid }

    it "has error message" do
      organization_subject.validate

      expect(organization_subject.errors.to_hash)
        .to eq(subject_id: ["already exists for this organization"])
    end
  end
end
