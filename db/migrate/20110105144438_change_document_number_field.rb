class ChangeDocumentNumberField < ActiveRecord::Migration
  def self.up
    rename_column :documents, :document_number, :number
  end

  def self.down
    rename_column :documents, :number, :document_number
  end
end
