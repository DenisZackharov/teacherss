require "rails_helper"

describe FieldOfStudies::FindOrCreateRecord do
  include_context "with interactor"

  describe ".call" do
    let(:initial_context) do
      {
        field_of_study_params: field_of_study_params
      }
    end
    let(:field_of_study_params) do
      {
        name: "IT"
      }
    end

    context "when field of study exists" do
      let!(:existed_field_of_study) { create(:field_of_study, name: "IT") }

      it "finds field of study" do
        expect(executed_context.field_of_study).to eq(existed_field_of_study)
        expect { interactor.run }.not_to change(FieldOfStudy, :count)
      end
    end

    context "when field of study isn't exist" do
      it "creates a field of study" do
        expect { interactor.run }.to change(FieldOfStudy, :count).from(0).to(1)
      end
    end

    context "when params is invalid" do
      let(:field_of_study_params) do
        {
          name: ""
        }
      end
      let(:error_data) do
        {
          message: "Field Of Study invalid",
          detail: ["Name can't be blank"]
        }
      end

      it_behaves_like "failed interactor"
    end
  end
end
