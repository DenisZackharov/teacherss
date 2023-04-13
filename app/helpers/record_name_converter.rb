module RecordNameConverter
  def model_name(record)
    record.class.name.titleize
  end

  def record_name(record)
    record.class.name.underscore
  end
end
