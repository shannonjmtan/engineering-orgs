class CreateJoinTableClubMajor < ActiveRecord::Migration
  def change
    create_join_table :clubs, :majors do |t|
      t.index [:club_id, :major_id]
      t.index [:major_id, :club_id]
    end
  end
end
