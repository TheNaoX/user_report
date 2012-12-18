class ReportsController < ApplicationController
  def index
    @employees = Employee.all
    @total_amount = Account.total_amount rescue "No totals"
    respond_to do |format|
      format.html
      format.csv { render text: Employee.csv_report }
    end
  end
end
