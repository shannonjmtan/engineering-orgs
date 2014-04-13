class CreateJoinTableClubTypeClub < ActiveRecord::Migration
  def change
    create_join_table :club_types, :clubs do |t|
      t.index [:club_id, :club_type_id]
      t.index [:club_type_id, :club_id]
    end
  end
end
