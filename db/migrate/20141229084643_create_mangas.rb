class CreateMangas < ActiveRecord::Migration
  def change
    create_table :mangas do |t|
      t.timestamps null: false
    end
  end
end
