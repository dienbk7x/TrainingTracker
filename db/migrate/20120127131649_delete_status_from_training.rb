class DeleteStatusFromTraining < ActiveRecord::Migration
  def up
    remove_column :trainings, :status_id
  end

  def down
    change_table :trainings do |t|
      t.references :status
    end
  end
end
