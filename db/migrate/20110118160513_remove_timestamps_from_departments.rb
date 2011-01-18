class RemoveTimestampsFromDepartments < ActiveRecord::Migration
  def self.up
    remove_column :departments, :created_at
    remove_column :departments, :updated_at
  end

  def self.down
    change_table :departments do |t|
      t.timestamps
    end
  end
end
