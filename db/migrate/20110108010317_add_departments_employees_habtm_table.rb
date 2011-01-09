class AddDepartmentsEmployeesHabtmTable < ActiveRecord::Migration
  def self.up
    create_table :departments_employees, :id => false do |t|
          t.references :department
          t.references :employee
    end
    remove_column :employees, :department_id
  end

  def self.down
    drop_table :departments_employees
    add_column :employees, :department_id, :integer
  end
end
