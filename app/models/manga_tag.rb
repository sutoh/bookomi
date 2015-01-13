class MangaTag < ActiveRecord::Base
  belongs_to :manga
  belongs_to :tag
  validate :valid_relation_uniq

  # 既に登録済みのパターン(TagにもMangaTagsにも登録済み)
  def valid_relation_uniq
    if MangaTag.find_by(tag_id: tag_id, manga_id: manga_id)
      binding.pry
      errors.add(:uniqs, '既に登録済みのタグを2重で登録しようとしています。')
    end
  end

end
