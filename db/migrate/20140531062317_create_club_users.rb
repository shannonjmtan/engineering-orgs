class CreateClubUsers < ActiveRecord::Migration
  def change
    create_table :club_users do |t|
      t.references :user, index: true
      t.references :club, index: true

      t.timestamps
    end
  end
end
