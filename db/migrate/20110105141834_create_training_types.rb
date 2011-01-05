class CreateTrainingTypes < ActiveRecord::Migration
  def self.up
    create_table :training_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :training_types
  end
end
