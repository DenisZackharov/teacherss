module FlashPreparer
  include ErrorPreparer
  include ModelNameHelper

  def flash_message(result, action)
    if result.success?
      @subject = result.subject
      flash.now[:notice] = I18n.t("flash.#{action}", model: model_name(subject))
    else
      flash.now[:danger] = error_message(result)
    end
  end
end
