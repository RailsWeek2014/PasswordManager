class CreatePasswords < ActiveRecord::Migration
  def change
    create_table :passwords do |t|
      t.integer :user_id
      t.string :login
      t.string :url
      t.string :password

      t.timestamps
    end
  end
end
