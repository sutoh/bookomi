class Manga < ActiveRecord::Base
  has_one :tweet
  has_many :manga_tags
  has_many :tags, :through => :manga_tags
end
