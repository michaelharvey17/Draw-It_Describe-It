json.array!(@drawings) do |drawing|
  json.extract! drawing, :id, :user_id, :des_id, :counter, :parent, :active
  json.url drawing_url(drawing, format: :json)
end
