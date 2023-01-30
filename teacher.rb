require_relative 'person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission:)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_s
    "[Teacher] #{super}"
  end
end
