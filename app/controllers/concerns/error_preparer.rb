module ErrorPreparer
  private

  def error_message(result)
    message = result.error_data[:message]
    details = result.error_data[:detail].join(", ")

    "#{message}: #{details}"
  end
end
