class Text < ActiveRecord::Base
  belongs_to :student
  belongs_to :field
end
