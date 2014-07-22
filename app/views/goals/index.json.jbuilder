json.array!(@goals) do |goal|
  json.extract! goal, :id, :name, :description, :amount, :date
  json.url goal_url(goal, format: :json)
end
