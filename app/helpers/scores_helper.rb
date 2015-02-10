module ScoresHelper
  def badge_color(input)
    case input
    when 1
      "btn-danger"
    when 2
      "btn-warning"
    when 3
      "btn-info"
    when 4
      "btn-primary"
    when 5
      "btn-success"
    end
  end

  def alert_color(input)
    case input
    when 1..12
      "alert-danger"
    when 13..24
      "alert-warning"
    when 25..37
      "alert-info"
    when 37..50
      "alert-success"
    end
  end
end
