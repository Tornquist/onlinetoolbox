class Address < ActiveRecord::Base
  belongs_to :state
  belongs_to :student
  belongs_to :field

  def searchable
    [address_1, address_2, city, zip, state.abbreviation, state.name].join(" ")
  end
end
