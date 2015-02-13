class Gds < ActiveRecord::Base
  belongs_to :gds_types
  belongs_to :student
  belongs_to :user
  belongs_to :game

  #Only returns first for season
  def section_member
    begin
      game.season.sections.map(&:section_members).flatten(1).reject! { |x| x.student_id != student.id }.first
    rescue
      nil
    end
  end

  def rank
    begin
      section_member.section.ranks.map(&:rank_members).flatten(1).reject! { |x| x.student_id != student.id }.first.rank
    rescue
      nil
    end
  end

  #Only returns first for season
  def rank_name
    begin
      rank.name
    rescue
      "No Rank"
    end
  end

  def section_name
    begin
      section_member.section.name
    rescue
      "Unkown Section"
    end
  end

  def progress_bar_color
    if automatic
      "progress-bar-info"
    elsif available
      "progress-bar-success"
    else
      "progress-bar-danger"
    end
  end

  def progress_bar_float
    if gds_type_id == 3
      "pull-right"
    else
      ""
    end
  end

  def progress_bar_width
    if gds_type_id == 1
      "100%"
    else
      "50%"
    end
  end

  def pregame_available
    gds_type_id == 3 ? false : true
  end

  def halftime_available
    gds_type_id == 2 ? false : true
  end

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
