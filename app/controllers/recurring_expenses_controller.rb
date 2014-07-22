class RecurringExpensesController < ApplicationController
  before_action :set_recurring_expense, only: [:show, :edit, :update, :destroy]

  # GET /recurring_expenses
  # GET /recurring_expenses.json
  def index
    @recurring_expenses = RecurringExpense.all
  end

  # GET /recurring_expenses/1
  # GET /recurring_expenses/1.json
  def show
  end

  # GET /recurring_expenses/new
  def new
    @recurring_expense = RecurringExpense.new
  end

  # GET /recurring_expenses/1/edit
  def edit
  end

  # POST /recurring_expenses
  # POST /recurring_expenses.json
  def create
    @recurring_expense = RecurringExpense.new(recurring_expense_params)

    respond_to do |format|
      if @recurring_expense.save
        format.html { redirect_to @recurring_expense, notice: 'Recurring expense was successfully created.' }
        format.json { render :show, status: :created, location: @recurring_expense }
      else
        format.html { render :new }
        format.json { render json: @recurring_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recurring_expenses/1
  # PATCH/PUT /recurring_expenses/1.json
  def update
    respond_to do |format|
      if @recurring_expense.update(recurring_expense_params)
        format.html { redirect_to @recurring_expense, notice: 'Recurring expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @recurring_expense }
      else
        format.html { render :edit }
        format.json { render json: @recurring_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recurring_expenses/1
  # DELETE /recurring_expenses/1.json
  def destroy
    @recurring_expense.destroy
    respond_to do |format|
      format.html { redirect_to recurring_expenses_url, notice: 'Recurring expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recurring_expense
      @recurring_expense = RecurringExpense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recurring_expense_params
      params.require(:recurring_expense).permit(:name, :amount, :ingress, :egress)
    end
end
