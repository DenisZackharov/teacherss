module FieldOfStudies
  class FindOrCreateRecord
    include Interactor
    include ModelNameHelper

    delegate :field_of_study_params, to: :context

    def call
      context.fail!(error_data: error_data) unless field_of_study.save

      context.field_of_study = field_of_study
    end

    private

    def field_of_study
      @field_of_study ||= FieldOfStudy.find_or_initialize_by(field_of_study_params)
    end

    def error_data
      {
        message: I18n.t("errors.messages.record_invalid", model: model_name(field_of_study)),
        detail: field_of_study.errors.to_a
      }
    end
  end
end
