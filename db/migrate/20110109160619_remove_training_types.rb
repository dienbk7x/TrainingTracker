class RemoveTrainingTypes < ActiveRecord::Migration
  def self.up
    drop_table :training_types
  end

  def self.down
    create_table :training_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
