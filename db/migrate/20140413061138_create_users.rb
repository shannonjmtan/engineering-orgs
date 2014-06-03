class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.boolean :site_admin, :default => false
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
