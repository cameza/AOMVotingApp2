json.array!(@nominees) do |nominee|
  json.extract! nominee, :id, :mail, :name, :cv, :statement, :committee_check, :chairman_check, :confirmed, :not_confirmed, :abstained
  json.url nominee_url(nominee, format: :json)
end
