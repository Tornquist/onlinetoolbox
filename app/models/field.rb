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
end
