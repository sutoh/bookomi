json.array!(@mangas) do |manga|
  json.extract! manga, :id, :tweet_id
  json.url manga_url(manga, format: :json)
end
