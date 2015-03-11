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
end
