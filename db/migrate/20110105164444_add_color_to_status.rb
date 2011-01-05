class AddColorToStatus < ActiveRecord::Migration
  def self.up
    add_column :statuses, :color, :string
  end

  def self.down
    remove_column :statuses, :color
  end
end
