class AddTweetBackupImageUrls < ActiveRecord::Migration
  def change
    add_column :tweets, :backup_image_urls, :text
    add_column :tweets, :backup_deletes, :text
  end
end
