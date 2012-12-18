class AddEmployeeIdToAccount < ActiveRecord::Migration
  def up
    add_column :accounts, :employee_id, :integer
  end

  def down
    remove_column :accounts, :employee_id
  end
end
