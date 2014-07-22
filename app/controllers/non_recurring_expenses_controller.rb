class NonRecurringExpensesController < ApplicationController
  before_action :set_non_recurring_expense, only: [:show, :edit, :update, :destroy]

  # GET /non_recurring_expenses
  # GET /non_recurring_expenses.json
  def index
    @non_recurring_expenses = NonRecurringExpense.all
  end

  # GET /non_recurring_expenses/1
  # GET /non_recurring_expenses/1.json
  def show
  end

  # GET /non_recurring_expenses/new
  def new
    @non_recurring_expense = NonRecurringExpense.new
  end

  # GET /non_recurring_expenses/1/edit
  def edit
  end

  # POST /non_recurring_expenses
  # POST /non_recurring_expenses.json
  def create
    @non_recurring_expense = NonRecurringExpense.new(non_recurring_expense_params)

    respond_to do |format|
      if @non_recurring_expense.save
        format.html { redirect_to @non_recurring_expense, notice: 'Non recurring expense was successfully created.' }
        format.json { render :show, status: :created, location: @non_recurring_expense }
      else
        format.html { render :new }
        format.json { render json: @non_recurring_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /non_recurring_expenses/1
  # PATCH/PUT /non_recurring_expenses/1.json
  def update
    respond_to do |format|
      if @non_recurring_expense.update(non_recurring_expense_params)
        format.html { redirect_to @non_recurring_expense, notice: 'Non recurring expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @non_recurring_expense }
      else
        format.html { render :edit }
        format.json { render json: @non_recurring_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /non_recurring_expenses/1
  # DELETE /non_recurring_expenses/1.json
  def destroy
    @non_recurring_expense.destroy
    respond_to do |format|
      format.html { redirect_to non_recurring_expenses_url, notice: 'Non recurring expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_non_recurring_expense
      @non_recurring_expense = NonRecurringExpense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def non_recurring_expense_params
      params.require(:non_recurring_expense).permit(:name, :amount, :ingress, :egress)
    end
end
