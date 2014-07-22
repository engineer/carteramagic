json.array!(@recurring_expenses) do |recurring_expense|
  json.extract! recurring_expense, :id, :name, :amount, :ingress, :egress
  json.url recurring_expense_url(recurring_expense, format: :json)
end
