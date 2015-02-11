class Gds < ActiveRecord::Base
  belongs_to :gds_types
  belongs_to :student
  belongs_to :user
  belongs_to :gds

  def pregame_color
    case gds_type_id
    when 1..2
      if available
        "alert-success"
      else
        "alert-danger"
      end
    when 3
      ""
    end
  end

  def pregame_text
    case gds_type_id
    when 1..2
      if available
        "Available for Pregame GDS Tasks"
      else
        "Unavailable for Pregame GDS Tasks"
      end
    when 3
      "Not on Pregame GDS"
    end
  end

  def halftime_color
    case gds_type_id
    when 1
      if available
        "alert-success"
      else
        "alert-danger"
      end
    when 2
      ""
    when 3
      if available
        "alert-success"
      else
        "alert-danger"
      end
    end
  end

  def halftime_text
    case gds_type_id
    when 1
      if available
        "Available for Halftime GDS Tasks"
      else
        "Unavailable for Halftime GDS Tasks"
      end
    when 2
      "Not on Halftime GDS"
    when 3
      if available
        "Available for Halftime GDS Tasks"
      else
        "Unavailable for Halftime GDS Tasks"
      end
    end
  end
end
