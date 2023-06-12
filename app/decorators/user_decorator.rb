class UserDecorator < ApplicationDecorator
  delegate :id, :first_name, :last_name, :middle_name, :role, :organization, :director?

  def first_name_last_name
    "#{object.first_name} #{object.last_name}"
  end

  def full_name
    [object.last_name, object.first_name, object.middle_name].compact.join(" ").presence
  end

  def value_with_id
    [last_name_and_initials, object.id]
  end

  def last_name_and_initials
    "#{object.last_name} #{initials}"
  end

  def role
    object.role.humanize
  end

  private

  def initials
    [object.first_name, object.middle_name].compact.map { |word| "#{word.first}." }.join(" ")
  end
end
