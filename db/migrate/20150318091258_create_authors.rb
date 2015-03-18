class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.integer :twitter_uid, limit: 8
      t.string :screen_name

      t.timestamps null: false
    end
  end
end
