class User < ActiveRecord::Base

  acts_as_paranoid

  # Model Associations
  has_many :club_users
  has_many :clubs, through: :club_users

  # Nested Attributes

  # Validations
  validates :username, :presence => true, length: { maximum: 255 }
  validates :password, :presence => true, length: { maximum: 255 }
  validates_confirmation_of :password
  validates :password_confirmation, :presence => true, if: :password_changed?
  validates :email, :presence => true

  def self.authenticate(username, password)
    user = find_by_username(username)
    if user != nil && user.password == password
      return user
    else
      return nil
    end
  end

end
