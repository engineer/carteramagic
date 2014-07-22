require 'test_helper'

class RecurringExpensesControllerTest < ActionController::TestCase
  setup do
    @recurring_expense = recurring_expenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recurring_expenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recurring_expense" do
    assert_difference('RecurringExpense.count') do
      post :create, recurring_expense: { amount: @recurring_expense.amount, egress: @recurring_expense.egress, ingress: @recurring_expense.ingress, name: @recurring_expense.name }
    end

    assert_redirected_to recurring_expense_path(assigns(:recurring_expense))
  end

  test "should show recurring_expense" do
    get :show, id: @recurring_expense
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recurring_expense
    assert_response :success
  end

  test "should update recurring_expense" do
    patch :update, id: @recurring_expense, recurring_expense: { amount: @recurring_expense.amount, egress: @recurring_expense.egress, ingress: @recurring_expense.ingress, name: @recurring_expense.name }
    assert_redirected_to recurring_expense_path(assigns(:recurring_expense))
  end

  test "should destroy recurring_expense" do
    assert_difference('RecurringExpense.count', -1) do
      delete :destroy, id: @recurring_expense
    end

    assert_redirected_to recurring_expenses_path
  end
end
