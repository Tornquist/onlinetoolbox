class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :claimed_students
  has_many :students, through: :claimed_students
  has_many :favorite_instruments
  has_many :instruments, through: :favorite_instruments
  has_many :scores
  has_many :gds
  has_many :gigs
  has_many :announcements

  def full_name
    first_name.to_s + " " + last_name.to_s
  end

  def check_permissions level
    UsersHelper.send(level, self)
  end

  # check to see if a user is active or not and deny login if not
  def active_for_authentication?
    super && !banned
  end
end
