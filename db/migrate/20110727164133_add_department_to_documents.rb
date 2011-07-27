class AddDepartmentToDocuments < ActiveRecord::Migration
  def change
    change_table :documents do |t|
      t.references :department
    end
  end
end
