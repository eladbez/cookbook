json.array!(@replies) do |reply|
  json.extract! reply, :id, :content, :user_id, :post_id
  json.url reply_url(reply, format: :json)
end
