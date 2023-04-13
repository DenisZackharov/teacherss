require "rails_helper"

describe Subjects::FindOrCreateRecord do
  include_context "with interactor"

  describe ".call" do
    let(:initial_context) do
      {
        subject_params: subject_params
      }
    end
    let(:subject_params) do
      {
        name: "Physics"
      }
    end

    context "when subject exists" do
      let!(:existed_subject) { create(:subject, name: "Physics") }

      it "finds subject" do
        expect(executed_context.subject).to eq(existed_subject)
        expect { interactor.run }.not_to change(Subject, :count)
      end
    end

    context "when subject isn't exist" do
      it "creates a subject" do
        expect { interactor.run }.to change(Subject, :count).from(0).to(1)
      end
    end

    context "when params is invalid" do
      let(:subject_params) do
        {
          name: ""
        }
      end
      let(:error_data) do
        {
          message: "Subject invalid",
          detail: ["Name can't be blank"]
        }
      end

      it_behaves_like "failed interactor"
    end
  end
end
