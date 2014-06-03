class ClubType < ActiveRecord::Base

  # Model Associations
  has_many :club_type_clubs
  has_many :clubs, through: :club_type_clubs

  # Nested Attributes

  # Validations
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 255 }

end
