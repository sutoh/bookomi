class AddUidToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :uid, :integer, limit: 8
  end
end
