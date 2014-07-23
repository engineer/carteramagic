class Calculate
  
  def initialize(user)
    @user = user
  end
  
  def can_spend(amount_spend, day_spend)

    goal = @user.goals.where(["? >= goals.start_at and ? <= goals.end_at", day_spend, day_spend])

    if goal.nil?
      
      begin_date = day_spend.beginning_of_month.beginning_of_day
      end_date = day_spend.end_of_month.end_of_day

    else

      date_min = goal.map { |x| x.start_at }.min
      date_max = goal.map { |x| x.end_at }.max

      begin_date = date_min.beginning_of_month.beginning_of_day
      end_date = date_max.end_of_month.end_of_day

    end

    incomes = @user.variable_payments.where(["variable_payments.income = ? AND variable_payments.created_at >= ? AND variable_payments.created_at <= ? ", true, begin_date, end_date]).sum(:amount)
    spends = @user.variable_payments.where(["variable_payments.income = ? AND variable_payments.created_at >= ? AND variable_payments.created_at <= ? ", false, begin_date, end_date]).sum(:amount)

    available = incomes - spends
    available = available - amount_spend
    
    if goal.nil?
      
      result = available > 0

    else
      
      sum_amount = goal.map { |x| x.amount }.inject{ |sum, x| sum + x }
      result = available > sum_amount

    end

    return result
    
  end
  
end