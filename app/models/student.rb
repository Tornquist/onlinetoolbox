class Student < ActiveRecord::Base
  has_many :student_instruments
  has_many :instruments, through: :student_instruments
  has_many :ensembles, through: :student_instruments
  has_many :addresses
  has_many :texts
  has_many :options
  has_many :comments
  has_many :claimed_students
  has_many :section_members
  has_many :sections, through: :section_members
  has_many :rank_members
  has_many :ranks, through: :rank_members
  has_many :scores
  has_many :gds
  has_many :gigs

  accepts_nested_attributes_for :student_instruments, :allow_destroy => true
  accepts_nested_attributes_for :texts#, :reject_if => lambda { |a| a[:content].blank? }
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :options
  accepts_nested_attributes_for :section_members, :allow_destroy => true

  def fields
    (addresses + texts + options).map { |o| o.field }
  end

  def field(i)
    f = Field.find(i)
    case f.group
    when Group.where(name: "Address").first
      retVal = addresses.where(field_id: i).first
      if (retVal.nil?)
        retVal = Address.create(student_id: id, field_id: i, state_id: 1)
      end
      return retVal
    when Group.where(name: "Text").first
      retVal = texts.where(field_id: i).first
      if (retVal.nil?)
        retVal = Text.create(student_id: id, field_id: i)
      end
      return retVal
    when Group.where(name: "Option").first
      retVal = options.where(field_id: i).first
      if (retVal.nil?)
        retVal = Option.create(student_id: id, field_id: i)
      end
      return retVal
    end
  end

  def full_name_reversed
    arr = [last_name, first_name]
    arr.reject! { |c| c.empty? }
    arr.join(", ")
  end

  def full_name
    arr = [first_name, last_name]
    arr.reject! { |c| c.empty? }
    arr.join(" ")
  end

  def major
    field(Field.where(name: "Major").first.id).content
  end

  def hometown
    f = field(Field.where(name: "Address").first.id)
    arr = [f.city, f.state.abbreviation]
    arr.reject! { |c| c.empty? }
    arr.join(", ")
  end

  def instrument_list
    instruments.uniq.map { |i| i.name}.join(", ")
  end

  def ensemble_list
    ensembles.uniq.map { |i| i.name}.join(", ")
  end

  def rank_list
    rank_sections = ranks.map(&:section)
    extra_sections = sections - rank_sections
    result = []
    ranks.each do |rank|
      s = rank.section
      result << (s.season.name + "/" + s.name + "/" + rank.name)
    end
    extra_sections.each do |section|
      result << section.season.name + "/" + section.name
    end
    result.join(", ")
  end

  def cell_phone
    f = field(Field.where(name: "Cell Phone").first.id)
    f.content
  end

  def home_phone
    f = field(Field.where(name: "Home Phone").first.id)
    f.content
  end

  def status
    first = comments.order('created_at DESC').first
    first.nil? ? "Unknown" : first.recruit_status.name
  end

  def column_color
    section_members.size == 0 ? "" : "success"
  end

  def rank(section)
    arr = ranks.where(:section_id => section.id)
    if (arr.size == 0)
      RankMember.new(student_id: id)
    else
      rank = arr.first
      RankMember.where(student_id: id, rank_id: rank.id).first
    end
  end

  def gdsScore(section)
    scores = Score.where(game_id: section.season.games, student_id: id)
    sum = 0
    scores.each { |score| sum += score.total }
    sum
  end

  def gdsCount(section)
    gdsGames = Gds.where(game_id: section.season.games, student_id: id)
    gdsGames.size
  end

  def season_gigs(season)
    gigs.where(game_id: season.games.map(&:id))
  end

  def season_rank_text(season)
    begin
      ranks.where(section_id: season.sections.map(&:id)).first.name
    rescue
      nil
    end
  end

  def season_section(season)
    begin
      sections.where(season_id: season.id).first
    rescue
      nil
    end
  end

  def season_section_text(season)
    begin
      season_section.name
    rescue
      nil
    end
  end

  def season_gig_count(season)
    score = 0
    season.games.order(:played_on).each do |game|
      game_gds = gds.where(game_id: game)
      game_gigs = gigs.where(game_id: game)
      if (!game_gds.empty?)
        if game_gds.first.automatic
          score = 0
        end
      end
      if (!game_gigs.empty?)
        game_gigs.each do |gig|
          score = score + gig.value
        end
      end
    end
    score
  end

  def automatic_gds(season)
    (season_gig_count(season) >= 4)
  end

end
