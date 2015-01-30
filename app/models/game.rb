class Game < ActiveRecord::Base
  belongs_to :season
  before_save :format_date
  attr_accessor :game_date

  def format_date
    self.played_on = Date.strptime(self.game_date, "%m/%d/%Y").to_time(:utc)
  end
end
