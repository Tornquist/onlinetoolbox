class Option < ActiveRecord::Base
  belongs_to :student
  belongs_to :field

  def value
    Field.where(id: field_id).first.options[choice]
  end
end
