class Major < ActiveRecord::Base

  # Model Associations
  has_and_belongs_to_many :clubs

  # Nested Attributes

  # Validations
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 255 }

end
