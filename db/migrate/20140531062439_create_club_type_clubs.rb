class CreateClubTypeClubs < ActiveRecord::Migration
  def change
    create_table :club_type_clubs do |t|
      t.references :club_type, index: true
      t.references :club, index: true

      t.timestamps
    end
  end
end
