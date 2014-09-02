json.array!(@views) do |view|
  json.extract! view, :id, :name, :body, :user_id
  json.url view_url(view, format: :json)
end
