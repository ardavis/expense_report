class ExpensesController < ApplicationController
  before_filter :get_report

  def index
    @expenses = @report.expenses
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = @report.expenses.new
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def create
    @expense = @report.expenses.new(params[:expense])

    if @expense.save
      redirect_to @report, notice: 'Expense added!'
    else
      render :new
    end
  end

  def update
    @expense = Expense.find(params[:id])

    if @expense.update_attributes(params[:expense])
      redirect_to @report, notice: 'Expense updated!'
    else
      render :edit
    end
  end

  def destroy
    Expense.find(params[:id]).destroy
    redirect_to @report, notice: 'Expense removed!'
  end

  private

  def get_report
    @report = Report.find(params[:report_id])
  end
end
