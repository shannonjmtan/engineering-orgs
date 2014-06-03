json.array!(@clubs) do |club|
  json.extract! club, :id, :name, :email, :website, :description, :joining, :deleted_at
  json.url club_url(club, format: :json)
end
