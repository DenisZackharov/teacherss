require "rails_helper"

describe TeacherSpecializationDecorator do
  subject(:decorator) { described_class.new(teacher_specialization) }

  let(:user) { build_stubbed(:user, first_name: "John", last_name: "Doe") }
  let(:field_of_study) { build_stubbed(:field_of_study, name: "Science") }
  let(:physic_subject) { build_stubbed(:subject, name: "Physics") }
  let(:teacher_specialization) do
    build_stubbed(
      :teacher_specialization,
      user: user,
      field_of_study: field_of_study,
      subject: physic_subject,
      degree: 7
    )
  end

  describe "#id" do
    it "returns the teacher specialization ID" do
      expect(decorator.id).to eq(teacher_specialization.id)
    end
  end

  describe "#user" do
    it "returns the decorated user" do
      expect(decorator.user).to be_decorated_with(UserDecorator)
    end
  end

  describe "#field_of_study" do
    it "returns the field of study name" do
      expect(decorator.field_of_study).to eq(field_of_study)
    end
  end

  describe "#subject" do
    it "returns the subject name" do
      expect(decorator.subject).to eq(physic_subject)
    end
  end

  describe "#degree" do
    it "returns the degree" do
      expect(decorator.degree).to eq(7)
    end
  end
end
