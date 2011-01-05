class ModifyEmployees < ActiveRecord::Migration
  def self.up
    change_table :employees do |t|
      t.remove :department
      t.references :department
      t.rename :name, :last_name
      t.string :first_name
      
    end
  end

  def self.down
    change_table :employees do |t|
      t.remove :first_name
      t.rename :last_name, :name
      t.remove :department_id
      t.string :department
    end
  end
end
