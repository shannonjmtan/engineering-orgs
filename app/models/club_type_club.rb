class ClubTypeClub < ActiveRecord::Base
  belongs_to :club_type
  belongs_to :club
end
