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
      return addresses.where(field_id: i).first
    when Group.where(name: "Text").first
      return texts.where(field_id: i).first
    when Group.where(name: "Option").first
      return options.where(field_id: i).first
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

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      student_hash = {}
      student_hash[:first_name] = row["first_name"].to_s
      student_hash[:last_name] = row["last_name"].to_s
      student_hash[:email] = row["email"].to_s

      student_instruments_attributes = {}
      addresses_attributes = {}
      texts_attributes = {}
      options_attributes = {}
      row.each do |key, value|
        if key.starts_with? "instrument"
          begin
            num = key.split("_").second
            temp = {}
            temp["instrument_id"] = Instrument.where(name: row["instrument_#{num}"]).first.id.to_s
            temp["ensemble_id"] = Ensemble.where(name: row["ensemble_#{num}"]).first.id.to_s
            student_instruments_attributes[student_instruments_attributes.size.to_s] = temp
          rescue
            if student_instruments_attributes.size == 0
              temp = {}
              temp["instrument_id"] = Instrument.where(name: "Unknown").first.id.to_s
              temp["ensemble_id"] = Ensemble.where(name: "Unknown").first.id.to_s
              student_instruments_attributes[student_instruments_attributes.size.to_s] = temp
            end
          end
        elsif key.include? "_city"
          name = key.split("_").first
          field = Field.where(name: name).first
          temp = {}
          temp["field_id"] = field.id.to_s
          temp["address_1"] = row[name + "_address_1"].to_s
          temp["address_2"] = row[name + "_address_2"].to_s
          temp["city"] = row[name + "_city"].to_s
          temp["zip"] = row[name + "_zip"].to_s
          state = State.where(name: row[name + "_state"]) + State.where(abbreviation: row[name + "_state"])
          state = state.empty? ? State.where(name: "").first : state.first
          temp["state_id"] = state.id.to_s
          addresses_attributes[addresses_attributes.size.to_s] = temp
        else
          field = Field.where(name: key)
          if !field.empty?
            if field.first.group == Group.where(name: "Option").first
              temp = {}
              temp["field_id"] = field.first.id.to_s
              temp["choice"] = value.to_s
              options_attributes[options_attributes.size.to_s] = temp
            elsif field.first.group == Group.where(name: "Text").first
              temp = {}
              temp["field_id"] = field.first.id.to_s
              temp["content"] = value.to_s
              texts_attributes[texts_attributes.size.to_s] = temp
            end
          end
        end
      end
      student_hash["student_instruments_attributes"] = student_instruments_attributes
      student_hash["addresses_attributes"] = addresses_attributes
      student_hash["options_attributes"] = options_attributes
      student_hash["texts_attributes"] = texts_attributes
      s = Student.create(student_hash)
      Field.all.each do |f|
        if s.field(f.id).nil?
          case f.group
          when Group.where(name: "Address").first
            Address.create({field_id: f.id, student_id: s.id})
          when Group.where(name: "Text").first
            Text.create({field_id: f.id, student_id: s.id})
          when Group.where(name: "Option").first
            Option.create({field_id: f.id, student_id: s.id})
          end
        end
      end
    end
  end
end
