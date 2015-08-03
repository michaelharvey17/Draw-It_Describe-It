json.array!(@descriptions) do |description|
  json.extract! description, :id, :user_id, :draw_id, :counter, :parent, :active
  json.url description_url(description, format: :json)
end
