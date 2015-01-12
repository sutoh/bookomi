class Tag < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :manga_tags
  has_many :mangas, :through => :manga_tags

  validates :name, presence: true
end
