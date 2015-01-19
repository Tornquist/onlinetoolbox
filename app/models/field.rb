class Field < ActiveRecord::Base
  #serialize :options
  belongs_to :group

  def choices(extra)
    o = options.split("\n")
    if !o.include?(extra) && !extra.blank?
      o.push(extra)
    end
    o.map { |a| [a,a] }
  end
end
