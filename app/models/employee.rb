class Employee < ActiveRecord::Base
  attr_accessible :firstname, :lastname

  validates_presence_of :firstname, :lastname

  has_one :account

  accepts_nested_attributes_for :account

  scope :search, lambda { |q| where('firstname LIKE ?', q) }

  def self.csv_report
    string_report = CSV.generate do |row|
      row << ["ID", "Fullname",	"Account number",	"Rate",	"Hours week",	"hours worked",	"Salary"]
      Employee.all.each do |employee|
        row << [employee.id, "#{employee.firstname} #{employee.lastname}", employee.account.account_number, employee.account.rate, employee.account.hours_week, employee.account.worked_hours, employee.account.salary]
      end
      row << [" "," "," "," "," ","Total: ", Employee.total_amount]
    end
    string_report
  end
end
