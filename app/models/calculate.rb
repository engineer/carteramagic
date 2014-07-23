class Calculate
  
  def initialize(user)
    @user = user
  end
  
  def can_spend(amount_spend, day_spend)
    
    goal = @user.goals.where(["? >= goals.start_at and ? <= goals.end_at", day_spend, day_spend]).first
    
    if goal.nil?
      begin_date = day_spend.beginning_of_month.beginning_of_day
      end_date = day_spend.end_of_month.end_of_day
    else
      begin_date = goal.start_at.beginning_of_day.beginning_of_day
      end_date = goal.end_at.end_of_day.end_of_day
    end

    incomes = @user.variable_payments.where(["variable_payments.income = ? AND variable_payments.created_at >= ? AND variable_payments.created_at <= ? ", true, begin_date, end_date]).sum(:amount)
    spends = @user.variable_payments.where(["variable_payments.income = ? AND variable_payments.created_at >= ? AND variable_payments.created_at <= ? ", false, begin_date, end_date]).sum(:amount)

    available = incomes - spends
    available = available - amount_spend
    
    if goal.nil?
      result = available > 0
    else
      result = available >= goal.amount
    end
    
    return result
    
  end
  
end