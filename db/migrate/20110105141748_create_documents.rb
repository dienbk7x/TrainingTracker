class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :name
      t.string :document_number
      t.text :description
      t.references :training_type

      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
