module FlashPreparer
  include ErrorPreparer
  include RecordNameConverter

  def flash_message(result, action, record)
    if result.success?
      instance_variable_set("@#{record_name(record)}", record)

      flash.now[:notice] = I18n.t("flash.#{action}", model: model_name(record))
    else
      flash.now[:danger] = error_message(result)
    end
  end
end
