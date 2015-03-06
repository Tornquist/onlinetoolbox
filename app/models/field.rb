class Field < ActiveRecord::Base
  #serialize :options
  include RankedModel
  belongs_to :group
  ranks :index

  def choices(extra)
    extra = extra.nil? ? "" : extra.strip
    o = options.split("\n").map { |i| i.strip }
    if !o.include?(extra) && !extra.blank?
      o.push(extra.strip)
    end
    o.map { |a| [a,a] }
  end

  def display_name
    "Field - " + name
  end

  def csv_columns
    if (group_id == 1) #Address
      ["#{name}_address_1", "#{name}_address_2", "#{name}_city", "#{name}_state", "#{name}_zip"]
    else
      [name]
    end
  end
end
