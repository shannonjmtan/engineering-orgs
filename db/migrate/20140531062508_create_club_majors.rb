class CreateClubMajors < ActiveRecord::Migration
  def change
    create_table :club_majors do |t|
      t.references :major, index: true
      t.references :club, index: true

      t.timestamps
    end
  end
end
