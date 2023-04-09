module ModelNameHelper
  def model_name(record)
    record.class.name
  end
end
