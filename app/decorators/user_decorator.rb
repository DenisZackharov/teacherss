class UserDecorator < ApplicationDecorator
  delegate :id, :first_name, :last_name, :role

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
