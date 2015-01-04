class Tag < ActiveRecord::Base
  has_many :manga_tags
  has_many :mangass, :through => :manga_tags
end
