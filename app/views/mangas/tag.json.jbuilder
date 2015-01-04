json.array!(@manga.tags) do |manga|
  json.extract! manga, :name
end
