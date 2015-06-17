class Ribbon < ActiveRecord::Base
  include RankedModel
  ranks :index

  has_many :student_ribbons
  has_many :students, through: :student_ribbons

  def adjusted_inventory
    adjust = 0
    student_ribbons.each do |student_ribbon|
      if (student_ribbon.issued_at != nil)
        adjust += 1
      end
    end
    inventory.to_i - adjust
  end

end
