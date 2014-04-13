class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :president
      t.string :year
      t.string :email
      t.string :website
      t.text :logo
      t.text :description
      t.text :joining
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
