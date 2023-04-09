module ModelNameHelper
  def model_name(record)
    record.class.model_name.name
  end
end
