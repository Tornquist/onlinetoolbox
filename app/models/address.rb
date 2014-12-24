class Address < ActiveRecord::Base
  belongs_to :state
  belongs_to :student
  belongs_to :field
end
