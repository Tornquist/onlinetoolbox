class Score < ActiveRecord::Base
  belongs_to :student
  belongs_to :game
  belongs_to :user

  def total
    sum = 0
    score = Score.find(id)
    scoring_symbols.each{ |s| sum += score.send(s) }
    sum
  end

  def scoring_symbols
    [:memorization, :music_effort, :marching_fundamentals, :marching_precision, :marching_effort, :rehearsal_etiquette, :preparedness, :punctuality, :gameday_enthusiasm, :gameday_professionalism]
  end
end
