class CreateAccounts < ActiveRecord::Migration
  def up
    create_table :accounts do |t|
      t.string :account_number
      t.integer :rate
      t.integer :hours_week
      t.integer :worked_hours
      t.timestamps
    end
    remove_column :employees, :account_number
    remove_column :employees, :rate 
    remove_column :employees, :hours_week
    remove_column :employees, :worked_hours
  end

  def down
    add_column :employees, :account_number, :string
    add_column :employees, :rate, :integer
    add_column :employees, :hours_week, :integer
    add_column :employees, :worked_hours, :integer
    drop_table :accounts
  end
end
