class CreateMangaTags < ActiveRecord::Migration
  def change
    create_table :manga_tags do |t|
      t.references :manga, index: true
      t.references :tag, index: true

      t.timestamps null: false
    end
    add_foreign_key :manga_tags, :mangas
    add_foreign_key :manga_tags, :tags
  end
end
