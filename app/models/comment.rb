class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :student
  belongs_to :contact_type
  belongs_to :recruit_status
end
