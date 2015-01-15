class Field < ActiveRecord::Base
  serialize :options
  belongs_to :group
end
