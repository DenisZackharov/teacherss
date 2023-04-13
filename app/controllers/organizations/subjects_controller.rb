module Organizations
  class SubjectsController < ApplicationController
    include FlashPreparer

    expose :subject
    expose :organization, id: -> { params[:organization_id] }
    expose :subjects, -> { organization.subjects.order(updated_at: :desc) }

    before_action :authorize_subject, only: %i[create update destroy]

    def create
      subject = create_subject.subject

      flash_message(create_subject, :create, subject)
    end

    def update
      subject = update_subject.subject

      flash_message(update_subject, :update, subject)
    end

    def destroy
      subject = destroy_subject.subject

      flash_message(destroy_subject, :destroy, subject)
    end

    private

    def create_subject
      @create_subject ||= ::Subjects::Create.call(
        organization: organization,
        subject_params: subject_params
      )
    end

    def update_subject
      @update_subject ||= ::Subjects::Update.call(
        subject: subject,
        organization: organization,
        subject_params: subject_params
      )
    end

    def destroy_subject
      @destroy_subject ||= ::Subjects::Destroy.call(
        subject: subject,
        organization: organization
      )
    end

    def subject_params
      params.require(:subject).permit(:name)
    end

    def authorize_subject
      authorize! subject
    end
  end
end
