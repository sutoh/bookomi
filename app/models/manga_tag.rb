class MangaTag < ActiveRecord::Base
  belongs_to :manga
  belongs_to :tag
end
