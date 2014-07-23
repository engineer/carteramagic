require_relative '../test_helper'

class CalculateTest < ActiveSupport::TestCase

   test "drop a good answer without any goal" do
    
    gabs = User.new
    gabs.email = "gabs@example.com"
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
    assert decision.can_spend(10, Date.today)
    
    end 
   
  test "can I spend some amount wtihout affect my goal?" do
    
    # Creacion de un usuario
    ian = User.new
    ian.email = "ian@example.com"
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
    calculadora = Calculate.new(ian)
    assert calculadora.can_spend(50, Date.today) 
    assert !calculadora.can_spend(300, Date.today) 
    
   end
  
end