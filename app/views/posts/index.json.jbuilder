json.array!(@posts) do |post|
  json.extract! post, :id, :image, :content, :last_visit
  json.url post_url(post, format: :json)
end
