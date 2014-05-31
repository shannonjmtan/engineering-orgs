class Major < ActiveRecord::Base

  # Model Associations
  has_many :club_majors
  has_many :clubs, through: :club_majors

  # Nested Attributes

  # Validations
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 255 }

end
