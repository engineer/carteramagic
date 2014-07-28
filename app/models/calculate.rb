class Calculate
  
  def initialize(user)
    @user = user
  end
  
  def can_spend(amount_spend, day_spend)

    goal = @user.goals.where(["? >= goals.start_at and ? <= goals.end_at", day_spend, day_spend])

    if goal.empty?
      
      global_begin_date = day_spend.beginning_of_month.beginning_of_day
      global_end_date = day_spend.end_of_month.end_of_day

    else

      min_goal_date = goal.map { |x| x.start_at }.min.beginning_of_day
      max_goal_date = goal.map { |x| x.end_at }.max.end_of_day

      #global_begin_date = min_goal_date.beginning_of_month.beginning_of_day
      #global_end_date = max_goal_date.end_of_month.end_of_day

      term = (max_goal_date - min_goal_date)/86400

      sum_amount = goal.map { |x| x.amount }.inject{ |sum, x| sum + x }
      goal_per_day = (sum_amount/term).round(3)

    end

    recurrent_incomes = @user.recurrent_payments.where(["recurrent_payments.income = ? AND recurrent_payments.effective_at >= ? AND recurrent_payments.effective_at <= ? ", true, global_begin_date, global_end_date]).sum(:amount)
    recurrent_spends = @user.recurrent_payments.where(["recurrent_payments.income = ? AND recurrent_payments.effective_at >= ? AND recurrent_payments.effective_at <= ? ", false, global_begin_date, global_end_date]).sum(:amount)

    variable_incomes = @user.variable_payments.where(["variable_payments.income = ? AND variable_payments.created_at >= ? AND variable_payments.created_at <= ? ", true, global_begin_date, global_end_date]).sum(:amount)
    variable_spends = @user.variable_payments.where(["variable_payments.income = ? AND variable_payments.created_at >= ? AND variable_payments.created_at <= ? ", false, global_begin_date, global_end_date]).sum(:amount)

    recurrent_available = recurrent_incomes - recurrent_spends
    variable_available = variable_incomes - variable_spends

    p recurrent_available
    p variable_available

    available = recurrent_available + variable_available
    available = available - amount_spend
    p available

    term_until_now = Date.today.day - min_goal_date.day
    available_until_now = (available/term_until_now).round(3)

    p available_until_now
    p goal_per_day
    
    if goal.empty?
      
      result = available > 0

    else
      
      # sum_amount = goal.map { |x| x.amount }.inject{ |sum, x| sum + x }
      result = available_until_now > goal_per_day

    end

    return result
    
  end
  
end