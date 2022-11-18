module ConfirmationHelper
  def email_value(resource)
    if resource.pending_reconfirmation?
      resource.unconfirmed_email
    else
      resource.email
    end
  end
end
