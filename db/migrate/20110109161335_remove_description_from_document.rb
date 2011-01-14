class RemoveDescriptionFromDocument < ActiveRecord::Migration
  def self.up
    remove_column :documents, :description
  end

  def self.down
    add_column :documents, :description, :text
  end
end
