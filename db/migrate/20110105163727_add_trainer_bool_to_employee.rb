class AddTrainerBoolToEmployee < ActiveRecord::Migration
  def self.up
    add_column :employees, :trainer, :boolean
  end

  def self.down
    remove_column :employees, :trainer
  end
end
