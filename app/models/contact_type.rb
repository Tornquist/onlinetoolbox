class ContactType < ActiveRecord::Base
  has_many :comments
end
