class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
    @expenses = @report.expenses
  end

  def new
    @report = Report.new
  end

  def edit
    @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(params[:report])

    if @report.save
      redirect_to @report, notice: 'Expense Report successfully created!'
    else
      render 'new'
    end
  end

  def update
    @report = Report.find(params[:id])
    
    if @report.update_attributes(params[:report])
      redirect_to @report, notice: 'Expense Report successfully updated!'
    else
      render 'edit'
    end
  end

  def destroy
    Report.find(params[:id]).destroy
    redirect_to reports_path
  end
end
