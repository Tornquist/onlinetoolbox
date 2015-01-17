class Field < ActiveRecord::Base
  #serialize :options
  belongs_to :group

  def choices(extra)
    o = options.split()
    if !o.include?(extra)
      o.push(extra)
    end
    o.map { |a| [a,a] }
  end
end
