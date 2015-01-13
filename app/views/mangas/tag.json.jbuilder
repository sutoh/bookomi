json.array!(@manga.tags) do |tag|
  json.extract! tag, :name
  json.delete_url url_for(tag_destroy_manga_path(@manga, tag: tag))
  json.show_url url_for(tag_path(tag))
end
