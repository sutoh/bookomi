class AddAuthorIdToTweets < ActiveRecord::Migration
  def change
    add_reference :tweets, :author, index: true
    add_foreign_key :tweets, :authors
  end
end
