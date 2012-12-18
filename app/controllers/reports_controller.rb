class ReportsController < ApplicationController
  def index
    @query = params[:query] unless params[:query].nil?
    unless @query.nil?
      @employees = Employee.search(@query)
    else
      @employees = Employee.all
    end

    @total_amount = Account.total_amount(@employees) rescue "No totals"
    respond_to do |format|
      format.html
      format.csv { render text: Employee.csv_report }
    end
  end
end
