class RemoveDocumentGroups < ActiveRecord::Migration
  def up
    drop_table :document_groups
    remove_column :documents, :document_group_id
  end

  def down
    create_table :document_groups do |t|
      t.string :name
      t.references :department

      t.timestamps
    end
    change_table :documents do |t|
      t.references :document_group
    end
  end
end
