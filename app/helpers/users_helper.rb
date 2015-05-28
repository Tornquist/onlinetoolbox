module UsersHelper
  def self.create_modify_users user
    user.admin || user.director || user.chief_of_staff
  end

  def self.make_announcements user
    user.admin || user.director || user.chief_of_staff
  end

  def self.modify_documentation user
    user.admin || user.director || user.chief_of_staff
  end

  def self.edit_site_variables user
    user.admin
  end

  def self.edit_fields user
    user.admin || user.recruitment_head
  end

  def self.edit_records user
    user.admin || user.recruitment_head
  end

  def self.edit_user_records user
    user.admin || user.recruitment_head || user.recruitment_officer
  end

  def self.modify_create_seasons user
    user.admin || user.director || user.chief_of_staff
  end

  def self.create_gigs user
    user.admin || user.chief_of_staff
  end

  def self.edit_gigs user
    user.admin || user.director
  end

  def self.delete_gigs user
    user.admin || user.director
  end

  def self.create_section_notes user
    user.admin || user.student_leader
  end

  def self.edit_section user
    user.admin || user.student_leader
  end

  def self.transfer_students user
    user.admin || user.student_leader
  end
end
