json.array!(@memberships) do |membership|
  json.extract! membership, :id, :user, :BeerClub
  json.url membership_url(membership, format: :json)
end
