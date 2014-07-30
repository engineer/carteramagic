require_relative '../test_helper'

class CalculateTest < ActiveSupport::TestCase

    # test "give a nice answer with extended (more than one month) goals" do

    # # Create a new user
    # devf = User.new
    # devf.email = "devf@example.com"
    # devf.password = devf.password_confirmation = "12345678"
    # devf.save!

    # # Create more than one goal
    # peda = Goal.new
    # peda.user = devf
    # peda.amount = 5000
    # peda.start_at = Date.new(2014, 6, 6)
    # peda.end_at = Date.new(2014, 7, 17)
    # peda.save!

    # weed = Goal.new
    # weed.user = devf
    # weed.amount = 4000
    # weed.start_at = Date.new(2014, 6, 1)
    # weed.end_at = Date.new(2014, 7, 25)
    # weed.save!

    # # Create a new recurrent payment (outcomes and income)
    # sueldo1 = RecurrentPayment.new
    # sueldo1.user = devf
    # sueldo1.amount = 6000
    # sueldo1.income = true
    # sueldo1.effective_at = Date.new(2014, 6, 15)
    # sueldo1.save!

    # sueldo2 = RecurrentPayment.new
    # sueldo2.user = devf
    # sueldo2.amount = 6000
    # sueldo2.income = true
    # sueldo2.effective_at = Date.new(2014, 6, 30)
    # sueldo2.save!

    # sueldo3 = RecurrentPayment.new
    # sueldo3.user = devf
    # sueldo3.amount = 6000
    # sueldo3.income = true
    # sueldo3.effective_at = Date.new(2014, 7, 15)
    # sueldo3.save!

    # sueldo4 = RecurrentPayment.new
    # sueldo4.user = devf
    # sueldo4.amount = 6000
    # sueldo4.income = true
    # sueldo4.effective_at = Date.new(2014, 7, 30)
    # sueldo4.save!

    # renta1 = RecurrentPayment.new
    # renta1.user = devf
    # renta1.amount = 1500
    # renta1.income = false
    # renta1.effective_at = Date.new(2014, 6, 5)
    # renta1.save!

    # renta2 = RecurrentPayment.new
    # renta2.user = devf
    # renta2.amount = 1500
    # renta2.income = false
    # renta2.effective_at = Date.new(2014, 7, 5)
    # renta2.save!

    # tdc1 = RecurrentPayment.new
    # tdc1.user = devf
    # tdc1.amount = 1000
    # tdc1.income = false
    # tdc1.effective_at = Date.new(2014, 6, 28)
    # tdc1.save!

    # tdc2 = RecurrentPayment.new
    # tdc2.user = devf
    # tdc2.amount = 1000
    # tdc2.income = false
    # tdc2.effective_at = Date.new(2014, 7, 28)
    # tdc2.save!

    # # Create new unique payments (outcomes and incomes)
    # tanda = VariablePayment.new
    # tanda.user = devf
    # tanda.amount = 1000
    # tanda.income = true
    # tanda.created_at = Date.new(2014, 6, 26)
    # tanda.save!

    # apuesta = VariablePayment.new
    # apuesta.user = devf
    # apuesta.amount = 2000
    # apuesta.income = true
    # apuesta.created_at = Date.new(2014, 7, 27)
    # apuesta.save!

    # mirenta = VariablePayment.new
    # mirenta.user = devf
    # mirenta.amount = 1500
    # mirenta.income = true
    # mirenta.created_at = Date.new(2014, 6, 9)
    # mirenta.save!

    # gastos = VariablePayment.new
    # gastos.user = devf
    # gastos.amount = 5500
    # gastos.income = false
    # gastos.created_at = Date.new(2014, 6, 3)
    # gastos.save!

    # semana1 = VariablePayment.new
    # semana1.user = devf
    # semana1.amount = 4000
    # semana1.income = false
    # semana1.created_at = Date.new(2014, 6, 19)
    # semana1.save!

    # semana2 = VariablePayment.new
    # semana2.user = devf
    # semana2.amount = 3700
    # semana2.income = false
    # semana2.created_at = Date.new(2014, 7, 4)
    # semana2.save!

    # semana3 = VariablePayment.new
    # semana3.user = devf
    # semana3.amount = 3500
    # semana3.income = false
    # semana3.created_at = Date.new(2014, 7, 13)
    # semana3.save!

    # semana4 = VariablePayment.new
    # semana4.user = devf
    # semana4.amount = 2000
    # semana4.income = false
    # semana4.created_at = Date.new(2014, 7, 26)
    # semana4.save!

    # # Can I spend some bucks in beer?
    # caguama = Calculate.new(devf)
    # assert caguama.can_spend(500, Date.today)
    # assert !caguama.can_spend(1600, Date.today)

    # end

  #   test "cool answer with variable and recurrent payments" do

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

  #   # Create a new recurrent payment (outcomes and income) with only one effective date
  #   sueldo = RecurrentPayment.new
  #   sueldo.user = vic
  #   sueldo.amount = 500
  #   sueldo.income = true
  #   sueldo.effective_at = Date.new(2014, 7, 15)
  #   sueldo.save!

  #   sueldo1 = RecurrentPayment.new
  #   sueldo1.user = vic
  #   sueldo1.amount = 500
  #   sueldo1.income = true
  #   sueldo1.effective_at = Date.new(2014, 7, 30)
  #   sueldo1.save!

  #   renta = RecurrentPayment.new
  #   renta.user = vic
  #   renta.amount = 300
  #   renta.income = false
  #   renta.effective_at = Date.new(2014, 7, 20)
  #   renta.save!

  #   tarjeta = RecurrentPayment.new
  #   tarjeta.user = vic
  #   tarjeta.amount = 200
  #   tarjeta.income = false
  #   tarjeta.effective_at = Date.new(2014, 7, 20)
  #   tarjeta.save!

  #   # Create new variable payments (outcomes and incomes)

  #   tanda = VariablePayment.new
  #   tanda.user = vic
  #   tanda.amount = 500
  #   tanda.income = true
  #   tanda.created_at = Date.new(2014, 7, 11)
  #   tanda.save!

  #   tea = VariablePayment.new
  #   tea.user = vic
  #   tea.amount = 100
  #   tea.income = false
  #   tea.created_at = Date.new(2014, 7, 7)
  #   tea.save!

  #   phone = VariablePayment.new
  #   phone.user = vic
  #   phone.amount = 220
  #   phone.income = false
  #   phone.created_at = Date.new(2014, 7, 16)
  #   phone.save!

  #   food = VariablePayment.new
  #   food.user = vic
  #   food.amount = 180
  #   food.income = false
  #   food.created_at = Date.new(2014, 7, 21)
  #   food.save!

  #   # Can I spend 99 bucks in beer?
  #   decision = Calculate.new(vic)
  #   assert decision.can_spend(99, Date.today) # Yes, you can!
  #   assert !decision.can_spend(150, Date.today) # No, you can't!

  # end

  # test "give a nice answer for two (or more) goals" do

  #   # Create a new user
  #   neto = User.new
  #   neto.email = "neto@example.com"
  #   neto.password = neto.password_confirmation = "12345678"
  #   neto.save!

  #   # Create more than one goal
  #   chelas = Goal.new
  #   chelas.user = neto
  #   chelas.amount = 300
  #   chelas.start_at = Date.new(2014, 7, 13)
  #   chelas.end_at = Date.new(2014, 7, 28)
  #   chelas.save!

  #   botana = Goal.new
  #   botana.user = neto
  #   botana.amount = 100
  #   botana.start_at = Date.new(2014, 7, 10)
  #   botana.end_at = Date.new(2014, 7, 24)
  #   botana.save!

  #   # Create new payments (incomes and outcomes)
  #   sueldo = VariablePayment.new
  #   sueldo.user = neto
  #   sueldo.amount = 1000
  #   sueldo.income = true # Income
  #   sueldo.created_at = Date.new(2014, 7, 15)
  #   sueldo.save!

  #   nexus = VariablePayment.new
  #   nexus.user = neto
  #   nexus.amount = 400
  #   nexus.income = false # Outcome
  #   nexus.created_at = Date.new(2014, 7, 20)
  #   nexus.save!

  #   cena = VariablePayment.new
  #   cena.user = neto
  #   cena.amount = 100
  #   cena.income = false # Outcome
  #   cena.created_at = Date.new(2014, 7, 21)
  #   cena.save!

  #   # Can I spend 50 bucks in beer?
  #   decision = Calculate.new(neto)
  #   assert decision.can_spend(50, Date.today) # Yes, you can!
  #   assert !decision.can_spend(150, Date.today) # No, you can't!

  # end

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
    # assert !decision.can_spend(30, Date.today) # No, you can't!

  end

  # test "can I spend some amount wtihout affect my goal?" do

  #   # Creacion de un usuario
  #   ian = User.new
  #   ian.email = "ian@example.com"
  #   ian.password = ian.password_confirmation = "12345678"
  #   ian.save! # Guardar en el servidor

  #   # Ingresos/egresos variables
  #   sueldo = VariablePayment.new
  #   sueldo.user = ian
  #   sueldo.amount = 200
  #   sueldo.income = true
  #   sueldo.created_at = 2.days.ago
  #   sueldo.save!

  #   papas = VariablePayment.new
  #   papas.user = ian
  #   papas.amount = 10
  #   papas.income = false
  #   papas.created_at = 2.days.ago
  #   papas.save!

  #   frutsi = VariablePayment.new
  #   frutsi.user = ian
  #   frutsi.amount = 5
  #   frutsi.income = false
  #   frutsi.created_at = 1.days.ago
  #   frutsi.save!

  #   coca = VariablePayment.new
  #   coca.user = ian
  #   coca.amount = 15
  #   coca.income = false
  #   coca.created_at = Date.today
  #   coca.save!

  #   # Creacion de una meta
  #   tacos = Goal.new
  #   tacos.user = ian
  #   tacos.amount = 100
  #   tacos.start_at = 5.days.ago
  #   tacos.end_at = Date.today
  #   tacos.save!

  #   # Proceso para determinar si se puede gastar o no
  #   decision = Calculate.new(ian)
  #   # $60 is the limit
  #   assert decision.can_spend(50, Date.today) # Yes, you can!
  #   assert !decision.can_spend(100, Date.today) # No, you can't!

  #  end

end
