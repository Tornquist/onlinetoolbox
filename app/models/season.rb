class Season < ActiveRecord::Base
  has_many :games
  accepts_nested_attributes_for :games, :allow_destroy => true
  before_save :format_date
  attr_accessor :start_date, :end_date

  def format_date
    self.start = Date.strptime(self.start_date, "%m/%d/%Y").to_time(:utc)
    self.end = Date.strptime(self.end_date, "%m/%d/%Y").to_time(:utc)
  end
end
