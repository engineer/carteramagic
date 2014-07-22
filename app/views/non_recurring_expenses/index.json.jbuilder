json.array!(@non_recurring_expenses) do |non_recurring_expense|
  json.extract! non_recurring_expense, :id, :name, :amount, :ingress, :egress
  json.url non_recurring_expense_url(non_recurring_expense, format: :json)
end
