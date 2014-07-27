require 'test_helper'

class NonRecurringExpensesControllerTest < ActionController::TestCase
  setup do
    @non_recurring_expense = non_recurring_expenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:non_recurring_expenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create non_recurring_expense" do
    assert_difference('NonRecurringExpense.count') do
      post :create, non_recurring_expense: { amount: @non_recurring_expense.amount, egress: @non_recurring_expense.egress, ingress: @non_recurring_expense.ingress, name: @non_recurring_expense.name }
    end

    assert_redirected_to non_recurring_expense_path(assigns(:non_recurring_expense))
  end

  test "should show non_recurring_expense" do
    get :show, id: @non_recurring_expense
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @non_recurring_expense
    assert_response :success
  end

  test "should update non_recurring_expense" do
    patch :update, id: @non_recurring_expense, non_recurring_expense: { amount: @non_recurring_expense.amount, egress: @non_recurring_expense.egress, ingress: @non_recurring_expense.ingress, name: @non_recurring_expense.name }
    assert_redirected_to non_recurring_expense_path(assigns(:non_recurring_expense))
  end

  test "should destroy non_recurring_expense" do
    assert_difference('NonRecurringExpense.count', -1) do
      delete :destroy, id: @non_recurring_expense
    end

    assert_redirected_to non_recurring_expenses_path
  end
end
