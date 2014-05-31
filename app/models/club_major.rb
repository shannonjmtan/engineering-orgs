class ClubMajor < ActiveRecord::Base
  belongs_to :major
  belongs_to :club
end
