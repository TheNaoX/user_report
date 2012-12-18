class Account < ActiveRecord::Base
  attr_accessible :account_number, :rate, :hours_week, :worked_hours, :employee_id

  validates_uniqueness_of :account_number

  validates :account_number, format: { 
    with: /^?[0-9]{16}/,
    message: "The account number should be 16 digits, letters and symbols not required"
  }

  belongs_to :employee
  
  def salary
    self.worked_hours * self.rate
  end

  def self.total_amount
    Employee.all.map { |e| e.account.salary}.sum
  end
end
