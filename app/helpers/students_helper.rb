module StudentsHelper
  def self.UnclaimedStudents
    claimed = ClaimedStudent.first.nil? ? [] : ClaimedStudent.first.claimed
    Student.all - claimed
  end

  def self.UnclaimedRecruits
    self.UnclaimedStudents.select { |x| x.recruit }
  end

  def self.format_students(array)
    ret = []
    array.each do |a|
      ret << StudentsHelper.format_hash(a)
    end
    ret
  end

  def self.format_hash(hash)
    hash.each_with_object({}) do |(k,v),g|
      g[k] =
      case v
      when Hash
        StudentsHelper.format_hash(v)
      else
        case k
        when "instrument_id"
          Instrument.find(v.to_i).name.to_s
        when "ensemble_id"
          Ensemble.find(v.to_i).name.to_s
        when "field_id"
          Field.find(v.to_i).name.to_s
        else
          v
        end
      end
      g
    end
  end

  def self.import_save_result(student_array)
    student_array.each do |student_hash|
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

  def self.import(file)
    student_array = []
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
      student_array << student_hash
    end
    student_array
  end
end
