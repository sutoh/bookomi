class Tag < ActiveRecord::Base
  has_many :manga_tags
  has_many :mangas, :through => :manga_tags
end
