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

  def scoring_text
    ["Memorized music/routine by required date set by Student Leader.",
     "Commitment towards excellence and proper execution of music/routine.",
     "Posture & Fundamentals",
     "Guiding, Phasing & Tempo Control: Precision and field awareness while marching.",
     "Parade Marching Enthusiasm & Effort",
     "Proper Rehearsal Etiquette",
     "All materials include, but not limited to the following: charts, marked music, pencil, earplugs, and equipment.",
     "Attendance should not affect this score. Being early to call time/warm-up when possible. (Score is # of times early)",
     "Stands Participation & Enthusiasm",
     "Conduct becoming of a bandsman, excellence on and off the field"]
  end
end
