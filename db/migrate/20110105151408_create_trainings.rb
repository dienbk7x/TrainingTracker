class CreateTrainings < ActiveRecord::Migration
  def self.up
    create_table :trainings do |t|
      t.references :document
      t.references :employee
      t.date :trained_on
      t.integer :trainer_id
      t.references :status
      t.integer :expires

      t.timestamps
    end
  end

  def self.down
    drop_table :trainings
  end
end
