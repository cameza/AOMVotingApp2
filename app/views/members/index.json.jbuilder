json.array!(@members) do |member|
  json.extract! member, :id, :mail
  json.url member_url(member, format: :json)
end
