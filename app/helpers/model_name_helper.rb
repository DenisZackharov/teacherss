module ModelNameHelper
  def model_name(record)
    record.class.name.titleize
  end
end
