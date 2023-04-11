require "rails_helper"

describe TeacherSpecialization do
  describe "validation" do
    it "has a valid factory" do
      expect(build(:teacher_specialization)).to be_valid
    end

    context "when foreign keys not unique" do
      subject(:teacher_specialization) do
        build(
          :teacher_specialization,
          subject: existed_teacher_specialization.subject,
          field_of_study: existed_teacher_specialization.field_of_study,
          user: existed_teacher_specialization.user
        )
      end

      let!(:existed_teacher_specialization) do
        create(:teacher_specialization)
      end

      it { is_expected.not_to be_valid }

      it "has error message" do
        teacher_specialization.validate

        expect(teacher_specialization.errors.to_hash)
          .to eq(user_id: ["has already been taken"])
      end
    end
  end
end
