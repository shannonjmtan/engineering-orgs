class Club < ActiveRecord::Base

  acts_as_paranoid

  # Model Associations
  has_many :club_type_clubs
  has_many :club_types, through: :club_type_clubs
  has_many :club_majors
  has_many :majors, through: :club_majors
  has_many :club_users
  has_many :users, through: :club_users

  # Nested Attributes
  accepts_nested_attributes_for :club_types
  accepts_nested_attributes_for :majors

  # Validations
  validates :name, :presence => true, length: { maximum: 255 }
  validates :president, :presence => true, length: { maximum: 255 }
  validates :year, length: { maximum: 255 }
  validates :email, length: { maximum: 255 }
  validates :website, length: { maximum: 255 }
  validates :description, :presence => true
  validates :joining, :presence => true

end
