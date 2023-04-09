module Organizations
  class SubjectsController < ApplicationController
    include FlashPreparer

    expose :subject
    expose :subjects, -> { @organization.subjects.order(updated_at: :desc) }

    before_action :fetch_organization, only: %i[index new create edit update destroy]
    before_action :authorize_subject, only: %i[create update destroy]

    def index; end

    def new; end

    def edit; end

    def create
      create_subject = ::Subjects::Create.call(organization: @organization, subject_params: subject_params)

      flash_message(create_subject, :create)
    end

    def update
      update_subject = ::Subjects::Update.call(
        subject: subject,
        organization: @organization,
        subject_params: subject_params
      )

      flash_message(update_subject, :update)
    end

    def destroy
      destroy_subject = ::Subjects::Destroy.call(subject: subject, organization: @organization)

      flash_message(destroy_subject, :destroy)
    end

    private

    def fetch_organization
      @organization = Organization.find(params[:organization_id])
    end

    def subject_params
      params.require(:subject).permit(:name)
    end

    def authorize_subject
      authorize! subject
    end
  end
end
