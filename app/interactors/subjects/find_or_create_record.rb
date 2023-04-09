module Subjects
  class FindOrCreateRecord
    include Interactor
    include ModelNameHelper

    delegate :subject_params, to: :context

    def call
      context.fail!(error_data: error_data) unless subject.save

      context.subject = subject
    end

    private

    def subject
      @subject ||= Subject.find_or_initialize_by(subject_params)
    end

    def error_data
      {
        message: I18n.t("errors.messages.record_invalid", model: model_name(subject)),
        detail: subject.errors.to_a
      }
    end
  end
end
