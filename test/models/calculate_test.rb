require_relative '../test_helper'

class CalculateTest < ActiveSupport::TestCase

  # test "cool answer with variable and recurrent payments on the same month" do

  #   # Create a new user
  #   vic = User.new
  #   vic.email = "vic@example.com"
  #   vic.password = vic.password_confirmation = "12345678"
  #   vic.save!

  #   # Create more than one goal
  #   tv = Goal.new
  #   tv.user = vic
  #   tv.amount = 200
  #   tv.start_at = Date.new(2014, 7, 18)
  #   tv.end_at = Date.new(2014, 7, 27)
  #   tv.save!

  #   apps = Goal.new
  #   apps.user = vic
  #   apps.amount = 200
  #   apps.start_at = Date.new(2014, 7, 10)
  #   apps.end_at = Date.new(2014, 7, 28)
  #   apps.save!

  #   # Create new variable payments (outcomes)
  #   tea = VariablePayment.new
  #   tea.user = vic
  #   tea.amount = 250
  #   tea.income = false # Outcome
  #   tea.created_at = Date.new(2014, 7, 7)
  #   tea.save!

  #   phone = VariablePayment.new
  #   phone.user = vic
  #   phone.amount = 320
  #   phone.income = false # Outcome
  #   phone.created_at = Date.new(2014, 7, 16)
  #   phone.save!
    
  #   food = VariablePayment.new
  #   food.user = vic
  #   food.amount = 180
  #   food.income = false # Outcome
  #   food.created_at = Date.new(2014, 7, 21)
  #   food.save!

  #   # Create a new recurrent payment (income) with an effective date
  #   sueldo = RecurrentPayment.new
  #   sueldo.user = vic
  #   sueldo.amount = 500
  #   sueldo.income = true # Income
  #   sueldo.effective_at = Date.new(2014, 7, 21)
  #   sueldo.save!

  # end
  
  test "give a nice answer for two (or more) goals" do
  
    # Create a new user
    neto = User.new
    neto.email = "neto@example.com"
    neto.password = neto.password_confirmation = "12345678"
    neto.save!

    # Create more than one goal
    chelas = Goal.new
    chelas.user = neto
    chelas.amount = 300
    chelas.start_at = Date.new(2014, 7, 13)
    chelas.end_at = Date.new(2014, 7, 28)
    chelas.save!

    botana = Goal.new
    botana.user = neto
    botana.amount = 100
    botana.start_at = Date.new(2014, 7, 10)
    botana.end_at = Date.new(2014, 7, 24)
    botana.save!

    # Create new payments (incomes and outcomes)
    sueldo = VariablePayment.new
    sueldo.user = neto
    sueldo.amount = 1000
    sueldo.income = true # Income
    sueldo.created_at = Date.new(2014, 7, 15)
    sueldo.save!

    nexus = VariablePayment.new
    nexus.user = neto
    nexus.amount = 400
    nexus.income = false # Outcome
    nexus.created_at = Date.new(2014, 7, 20)
    nexus.save!
    
    cena = VariablePayment.new
    cena.user = neto
    cena.amount = 100
    cena.income = false # Outcome
    cena.created_at = Date.new(2014, 7, 21)
    cena.save!

    # Can I spend 50 bucks in beer?
    decision = Calculate.new(neto)
    assert decision.can_spend(50, Date.today) # Yes, you can!
    assert !decision.can_spend(150, Date.today) # No, you can't!

  end

  test "drop a good answer without any goal" do
    
    gabs = User.new
    gabs.email = "gabs@example.com"
    gabs.password = gabs.password_confirmation = "12345678"
    gabs.save!
    
    pago = VariablePayment.new
    pago.user = gabs
    pago.amount = 100
    pago.income = true
    pago.created_at = 3.days.ago
    pago.save!
    
    sushi = VariablePayment.new
    sushi.user = gabs
    sushi.amount = 50
    sushi.income = false
    sushi.created_at = 2.days.ago
    sushi.save!
    
    chicle = VariablePayment.new
    chicle.user = gabs
    chicle.amount = 30
    chicle.income = false
    chicle.created_at = 1.days.ago
    chicle.save!
    
    decision = Calculate.new(gabs)
    assert decision.can_spend(10, Date.today) # Yes, you can!
    assert !decision.can_spend(30, Date.today) # No, you can't!
    
  end 
   
  test "can I spend some amount wtihout affect my goal?" do
    
    # Creacion de un usuario
    ian = User.new
    ian.email = "ian@example.com"
    ian.password = ian.password_confirmation = "12345678"
    ian.save! # Guardar en el servidor
    
    # Ingresos/egresos variables 
    sueldo = VariablePayment.new
    sueldo.user = ian
    sueldo.amount = 200
    sueldo.income = true
    sueldo.created_at = 2.days.ago
    sueldo.save!
    
    papas = VariablePayment.new
    papas.user = ian
    papas.amount = 10
    papas.income = false
    papas.created_at = 2.days.ago
    papas.save!
    
    frutsi = VariablePayment.new
    frutsi.user = ian
    frutsi.amount = 5
    frutsi.income = false
    frutsi.created_at = 1.days.ago
    frutsi.save!
    
    coca = VariablePayment.new
    coca.user = ian
    coca.amount = 15
    coca.income = false
    coca.created_at = Date.today
    coca.save!
    
    # Creacion de una meta
    tacos = Goal.new
    tacos.user = ian
    tacos.amount = 100
    tacos.start_at = 5.days.ago
    tacos.end_at = Date.today
    tacos.save!
    
    # Proceso para determinar si se puede gastar o no
    decision = Calculate.new(ian)
    assert decision.can_spend(50, Date.today) # Yes, you can!
    assert !decision.can_spend(300, Date.today) # No, you can't!
    
   end
  
end