class Field < ActiveRecord::Base
  serialize :options
  has_one :group
end
