json.array!(@tests) do |test|
  json.extract! test, :id, :test_name
  json.url test_url(test, format: :json)
end
