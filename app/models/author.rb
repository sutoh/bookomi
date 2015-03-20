class Author < ActiveRecord::Base
  extend FriendlyId
  friendly_id :screen_name, use: :slugged

  has_many :tweets
  paginates_per 50

  def normalize_friendly_id(string)
    string.gsub(/[\.\s]/, "-")
  end
end
