class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :name
      t.string :username
      t.integer :department
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
