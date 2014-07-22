class Calculate
  
  def initialize(user)
    @user = user
  end
  
  def can_spend(amount_spend, day_spend)
    goal = @user.goals.where(["? >= goals.start_at and ? <= goals.end_at", day_spend, day_spend]).first
    
    incomes = @user.variable_payments.where(["variable_payments.income = ? AND variable_payments.created_at >= ? AND variable_payments.created_at <= ? ", true, goal.start_at.beginning_of_day, goal.end_at.end_of_day]).sum(:amount)
    
    spends = @user.variable_payments.where(["variable_payments.income = ? AND variable_payments.created_at >= ? AND variable_payments.created_at <= ? ", false, goal.start_at.beginning_of_day, goal.end_at.end_of_day]).sum(:amount)
    
    available = incomes - spends
    available = available - amount_spend
    
    result = available >= goal.amount
    return result
  end
  
end