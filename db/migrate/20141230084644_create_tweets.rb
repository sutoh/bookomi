class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :manga, index: true
      t.string :tweet_id
      t.text :image_urls
      t.string :user_name
      t.string :screen_name
      t.text :tweet
      t.datetime :tweeted_at

      t.timestamps null: false
    end
    add_foreign_key :tweets, :mangas
  end
end
