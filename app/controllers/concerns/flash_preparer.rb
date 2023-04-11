module FlashPreparer
  include ErrorPreparer
  include ModelNameHelper

  def flash_message(result, action, record)
    if result.success?
      instance_variable_set("@#{record.class.name.underscore}", record)

      flash.now[:notice] = I18n.t("flash.#{action}", model: model_name(record))
    else
      flash.now[:danger] = error_message(result)
    end
  end
end
