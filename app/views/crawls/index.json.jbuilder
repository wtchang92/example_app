json.array!(@crawls) do |crawl|
  json.extract! crawl, :id, :title, :stops
  json.url crawl_url(crawl, format: :json)
end
